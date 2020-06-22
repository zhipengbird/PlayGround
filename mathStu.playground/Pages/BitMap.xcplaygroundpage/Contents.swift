//: [Previous](@previous)

import Foundation


class BitMap {
    var array:[Int64]
    let bitPerUnit:Int = 64
    let shift:Int = 6
    let mask:Int = 0x3F
    var size: Int = 0
    init(_ capcity: Int) {
        size = capcity
        array = [Int64](repeating: 0, count: 1 + capcity / bitPerUnit) 
    }
    
    /*:
     * 定位Bitmap某一位所对应的word
     * @param bitIndex 位图的第bitIndex位 
    */
    func getIndex(num:Int) -> Int {
        return num >> shift ///右移6位，相当于除以64
    }
    func setBit(bitIndex: Int)  {
        guard bitIndex < size else {
            print("超过bitmap有效范围")

            return
        }
        let index = getIndex(num: bitIndex)
        array[index] |= (1 << (bitIndex & mask )) 
    }
    func getBit(bitIndex: Int) -> Bool {
        guard bitIndex < size else {
            print("超过bitmap有效范围")
            return false
        }
        let index = getIndex(num: bitIndex)
        return array[index] & (1<<(bitIndex & mask)) != 0
    }
    func clear(bitIndex: Int)  {
        guard bitIndex < size else {
            print("超过bitmap有效范围")

            return
        }
        let index = getIndex(num: bitIndex)
        array[index] &= ~(1<<(bitIndex & mask))
    }
    
}
let bitMap = BitMap(400)
bitMap.setBit(bitIndex: 20)
bitMap.getBit(bitIndex: 20)
bitMap.array
bitMap.setBit(bitIndex: 21)
bitMap.getBit(bitIndex: 21)
bitMap.array
bitMap.setBit(bitIndex: 99)
bitMap.getBit(bitIndex: 99)
bitMap.array
bitMap.setBit(bitIndex: 98)
bitMap.getBit(bitIndex: 88)
bitMap.array
bitMap.clear(bitIndex: 20)
bitMap.array
bitMap.clear(bitIndex: 21)
bitMap.array
for index in (0..<200) {
    bitMap.setBit(bitIndex: index * 2)
}
for index  in 0..<500 {
    print("\(bitMap.getBit(bitIndex: index )) \t")
}
//: [Next](@next)
