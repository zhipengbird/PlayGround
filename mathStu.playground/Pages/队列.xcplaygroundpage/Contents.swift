//: [Previous](@previous)

import Foundation


struct Queue<T> {
    var array:[T] = []
    var isEmpty: Bool {
        return self.array.isEmpty
    }
    var count: Int {
        return self.array.count
    }
    public mutating func enqueue(_ newElement: T){
        array.append(newElement)
    }
    public  mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        return array.removeFirst()
    }
    var front: T? {
        return array.first ?? nil
    }
}
var queue = Queue<Int>()
queue.enqueue(2)
queue.enqueue(3)
queue.dequeue()
queue.dequeue()
queue.dequeue()


struct Queue2<T> {
    var array:[T] = []
    var length: Int
    var front:Int  = 0
    var rear: Int  = 0
    
    
    init(_ capcity: Int) {
        self.length = capcity
    }
    
    var isEmpty: Bool {
        return rear == front
    }
    var isFull: Bool {
        return (rear + 1) % length == front
    }
    mutating func enQueue(_ newElement: T) ->Bool {
        if (rear + 1) % length == front {
            print("queue full")
            return  false
        }
        if array.count < length {
            array.append(newElement)
        }else {
            array[rear] = newElement
        }
        rear = (rear+1)%length
        return true
    }
    mutating func deQueue()->T?{
        if rear == front {
            print("queue is empty")
            return nil
        }
        let element = array[front]
        front = (front + 1) % length
        return element
    }
    func traverQueue() -> [T] {
        var index = front
        var temp:[T] = []
        
        while index != rear {
            temp.append(array[index])
            index = (index+1)%length
        }
        return temp
    }
    
}
var queue2  = Queue2<Int>(4)
queue2.enQueue(1)
queue2.enQueue(4)
queue2.enQueue(5)
queue2.array.count
queue2.traverQueue()
queue2.deQueue()
queue2.array.count
queue2.deQueue()
queue2.array.count
queue2.enQueue(5)
queue2.deQueue()
queue2.array.count
queue2.traverQueue()


var str = "123456"
var index = str.index(str.startIndex, offsetBy: 2)
var str2  = str[index...] + str[str.startIndex..<index]  
var res = str.dropFirst(3) + str.prefix(3)
//str.lowercased()
var newNumstr = String(6996)
var array:[String] = []
var replaced : Bool = false
for val in newNumstr {
    if val == "6" , !replaced {
        array.append("9")
        replaced = true
    }else {
        array.append(String(val))
    }
}
Int(array.joined()) 
print(array.joined())

func findNumbers(_ nums: [Int]) -> Int {
    var count =  0
    for value in nums {
        if  String(value).count % 2 == 0 {
            count += 1
        } 
    }
    return count
}

func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
    var addArray:[Int] = []
    var num = K
    while num > 0 {
        addArray .append(num % 10)
        num /= 10
    }
    print(addArray)
    let counts = max(A.count, addArray.count)
    var res:[Int] = []
    var move:Int = 0
    let reversedA:[Int] = A.reversed()    
    for index in 0 ..< counts {
        var value1: Int = 0, value2:Int = 0 
        if index < reversedA.count {
            value1 = reversedA[index]
        }
        if index <  addArray.count {
            value2 = addArray[index]
        }
        let sum = value2 + value1 + move 
        move = sum / 10
        res.append(sum % 10)
        print(res)
    }
    if move > 0 {
        res.append(move)
    }
    return res.reversed()
}
//var A = [9,9,9,9,9,9,9,9,9,9]
var A = [1,2,0,0]

let K = 34
addToArrayForm(A, K)

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    func addNode(node: ListNode) -> ListNode {
        self.next = node
        node.next = nil
        return node
    }
}
func nextLargerNodes(_ head: ListNode?) -> [Int] {
    guard  let head = head else {
        return []
    }
    var slow: ListNode? = head
    var fast: ListNode? = head
    var res:[Int] = []
    while slow != nil {
        print(slow?.val ?? 0)
        fast = slow?.next
        while fast !=  nil,  fast!.val  < slow!.val {
            fast = fast?.next
        }
        print(fast?.val ?? 0)
        if fast != nil , fast!.val > slow!.val {
            res.append(fast!.val)
        }else {
            slow?.val = 0
            res.append(0)
        }
        slow = slow?.next
        print("next : \(slow?.val ?? 0)" )
    }
    print(res)
    return  res
}
var list = [2,1,2,5]
var header: ListNode? = nil;
for value in list {
    let node = ListNode(value)
    if header != nil   {
        header?.addNode(node: node)
    }else {
        header = node
    }
}
nextLargerNodes(header)


class CQueue {
    var enqueue:[Int] = []
    var dequeue:[Int] = []
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        enqueue.append(value)
    }
    
    func deleteHead() -> Int {
        if  dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
            return dequeue.removeLast() 
            
        }else {
            return dequeue.removeLast() 
        }
    }
}

//func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    var res:[Int] = []
//    var nums = nums2
//    for index in 0..<nums1.count {
//        let value = nums1[index]
//        let maxv = nums[index ..< nums.count].first { (val) -> Bool in
//            return val > value
//        } ?? -1
//        if value < maxv {
//            res.append(maxv)
//        }else {
//            res.append(-1)
//            
//        }
//        if let index =  nums.firstIndex(of: max(value, maxv)) {
//            nums[index] = -1
//        }
//        
//    }
//    return res
//}
func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var res:[Int] = []
    var stack:[Int] = []
    var map:[Int:Int] = [:]
    for num in nums2 {
        while !stack.isEmpty && stack.last! < num {
            let last = stack.removeLast()
            map[last] = num
        }
        stack.append(num)
    }
    print(stack,map)

    return nums1.map { map[$0] ?? -1}
}
let a = [4,1,2]
let b = [1,3,4,2]
//let a = [2,1,3]
//
//let b = [2,3,1]
nextGreaterElement(a, b)

//: [Next](@next)
