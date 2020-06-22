//: [Previous](@previous)

import Foundation

//输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。
func printNumbers(_ n: Int) -> [Int] {
    if n < 1 {
        return []
    }
    var limitNum: Int = 1
    for _ in 0..<n {
        limitNum *= 10
    }
    var res:[Int] = []
    for index in 1..<limitNum {
        res.append(index)
    }
    return res
}

printNumbers(1)
//: [Next](@next)
