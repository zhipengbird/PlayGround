import UIKit

var str = "Hello, playground"
// 
//
//var absences = [0,2,0,4,0,3,1,0]
//let secondHalf =  absences.suffix(absences.count/2)
//if let i  = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1]}){
//    print(absences[i])
//}
//
//let number = 0...9
//let shuffledNumbers = number.shuffled()
//
//var items =  [1,2,3,4,5,6,6,8,9]
//var last = items.endIndex - 1
//while last > 0 {
//    let rand = Int(arc4random_uniform(UInt32(last)))
//    print("swap items[\(last)] = \(items[last]) with items[\(rand)] =\(items[rand])")
//    items.swapAt(last, rand)
//    last -= 1
//}
//print(items)

let currentQueue = DispatchQueue(label: "co", qos: .default, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)

//print(1)
//currentQueue.async {
//print(2)
//    currentQueue.async {
//        print(3)
//    }
//    print(4)
//}
//print(5)


//print(1)
//currentQueue.sync {
//    print(2)
//    currentQueue.sync {
//        print(3)
//    }
//    print(4)
//}
//print(5)

//currentQueue.sync {
//    print(1)
//}
//print(2)
//currentQueue.sync {
//    print(3)
//}
//print(4)


currentQueue.async {
    print(1)
}
print(2)
currentQueue.async {
    print(3)
}
print(4)
