//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    //    let maxC = candies.
    guard let maxA = candies.max() else { return [] }
    let newres =  candies.map { (value) -> Bool in
        return value + extraCandies >= maxA
    }
    
    return newres
}

kidsWithCandies([2,3,5,1,3], 3)


func containsDuplicate(_ nums: [Int]) -> Bool {
    var set: [Int :Bool] = [:]
    for val in nums {
        if set[val] == true{
            return true
        }
        set[val] = true
    }
    return false
    
    //    let pairs = nums.map { ($0, 1) }
    //    print(pairs)
    //    let numsFreq = Dictionary(pairs, uniquingKeysWith: +)
    //    return !numsFreq.values.allSatisfy { $0 == 1 }
}
containsDuplicate([2,3,5,1,3])

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var map: [Int:Int] = [:]
    for (index, value) in nums.enumerated() {
        if  let oldIndex  = map[value] ,  index  - oldIndex == k {
            return true
        }
        map[value] = k  - index
    }
    return false
}
//[1,2,3,1,2,3]
//2
containsNearbyDuplicate([1,2,3,1], 3)

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
func kthToLast(_ head: ListNode?, _ k: Int) -> Int {
    guard let head = head else {return -1}
    var slowP: ListNode? = head
    var fasetP: ListNode? = head
    let i = 0
    while i < k , let _ = fasetP?.next  {
        fasetP = fasetP?.next
    }
    if let _  =  fasetP?.next  {
        while let _ = fasetP?.next {
            slowP = slowP?.next
            fasetP = fasetP?.next
        }
    }
    return slowP!.val
}


func replaceSpace(_ s: String) -> String { 
    var string = ""
    for v in s {
        if v == " " {
            string.append("%20")
        }else {
            string.append(v)
        }
    }
    return string
}
replaceSpace("1 2 3 3 s 3 ")
//: [Next](@next)


func replaceElements(_ arr: [Int]) -> [Int] {
    var res:[Int]  = [Int].init(repeating: -1 , count: arr.count)
    var maxValue : Int = -1
    for index  in (0 ..< arr.count).reversed() {
            res[index] = maxValue
             maxValue = max(arr[index], maxValue)
    }
    return res
}

let ar = [17,18,5,4,6,1]
replaceElements(ar)
[18,6,6,6,1,-1]


