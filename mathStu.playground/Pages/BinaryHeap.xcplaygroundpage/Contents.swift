//: [Previous](@previous)

import Foundation


class BinaryHeap<T:Comparable> {
    var heap:[T] = []
    init(_ array: [T]) {
        heap = array
        buildHeap()
    }
    func upAdjust()  {
        var childIndex = heap.count - 1
        var parentIndex = (childIndex - 1) / 2
        let temp = heap[childIndex]
        while childIndex > 0 , temp < heap[parentIndex] {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (parentIndex - 1 ) / 2
        }
        heap[childIndex] = temp
    }
    func downAdjust(_ parent: Int,_ length: Int)  {
        let temp  = heap[parent]
        var parentIndex = parent
        
        var childIndex = 2 * parentIndex + 1
        while childIndex < length {
            if childIndex +  1 < length ,heap[childIndex + 1] < heap[childIndex] {
                childIndex += 1
            }
            if temp <= heap[childIndex] {
                break
            }
            heap[parentIndex] =  heap[childIndex]
            parentIndex = childIndex
            childIndex  = 2 * parentIndex + 1
        }
        heap[parentIndex] = temp
    }
    func insert(_ data: T)  {
        heap.append(data)
        upAdjust()
    }
    func delete()  {
        heap[0] = heap[heap.endIndex - 1]
        heap.removeLast()
        downAdjust(0,heap.count)
    }
    func minData() -> T? {
        return heap.first
    }
    func buildHeap()  {
        for index in (0 ... (heap.count - 2)/2).reversed() {
            downAdjust(index,heap.count)
        }
    }
    func heapSort() -> [T] {
        if heap.isEmpty {
            return []
        }
        for index  in (1...(heap.count - 1)).reversed(){
            heap.swapAt(0, index)
            downAdjust(0, index)
        }
        print(heap)
        return heap
    }
}
extension BinaryHeap: CustomStringConvertible {
    var description: String{
        return heap.description
    }
}

class BinaryMaxHeap<T:Comparable> {
    var  heap:[T] = []
    init(_ source:[T]) {
        heap = source
        buildHeap()
    }
    func upAdjust() {
        var childIndex = heap.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        let temp = heap[childIndex]
        while childIndex > 0 , temp > heap[parentIndex] {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (parentIndex - 1) / 2
        }
        heap[childIndex] = temp
    }
    func downAdjust(_ parentIndex: Int,_ length: Int)  {
        var parentIndex = parentIndex
        let temp = heap[parentIndex]
        var childIndex = parentIndex * 2 + 1
        while childIndex < length {
            if childIndex + 1 < length , heap[childIndex ] < heap[childIndex + 1] {
                childIndex += 1
            }
            if  heap[childIndex] <= temp  {
                break
            }
            heap[parentIndex] = heap[childIndex] 
            parentIndex = childIndex
            childIndex = 2 * childIndex + 1
        }
        heap[parentIndex] = temp
        print(heap)
    }
    func buildHeap()  {
        for index in (0 ... ((heap.count - 2) / 2 )).reversed() {
            downAdjust(index,heap.count)
        }
    }
    func heapSort() -> [T] {
        if heap.isEmpty {
            return []
        }
        for index  in (1...(heap.count - 1)).reversed(){
            heap.swapAt(0, index)
            downAdjust(0, index)
        }
        return heap
    }
}
extension BinaryMaxHeap: CustomStringConvertible {
    var description: String{
        return heap.description
    }
}


class PriorityQueue<T: Comparable> {
    var heap:[T] = []
    let priorityFunction : (T, T) -> Bool
    init(_ source: [T],priorityFunction: @escaping (T, T) -> Bool) {
        heap = source
        self.priorityFunction  = priorityFunction
        bulidHeap()
    }
    func deQueue() -> T? {
        guard !heap.isEmpty  else {return nil}
        heap.swapAt(0, heap.count - 1)
        let temp =  heap.removeLast()
        downAdjust(0, length: heap.count)
        return temp
    }
    func enQueue(_ element: T)  {
        heap.append(element)
        upAdjust()
    }
    func upAdjust() {
        

        print(heap)
        var childIndex = heap.count - 1
        var parentIndex = (childIndex - 1)/2
        let temp = heap[childIndex]
        while childIndex > 0 , temp > heap[parentIndex] {
            //子节点值向上走
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (parentIndex - 1 ) / 2
        }
        heap[childIndex] = temp
    }
    func downAdjust(_ index: Int, length: Int)  {
        var parentIndex = index
        var childIndex = index * 2 + 1
        let temp = heap[parentIndex]
        while childIndex < length {
            
            //如果有右节点， 且右节点大于左节点，则定位到右节点
            if childIndex + 1 < length , heap[childIndex] < heap[childIndex + 1] {
                childIndex += 1
            }
            //父节点大于子节点
            if temp >= heap[childIndex] {
                break
            }
            //与子节点交换值
            heap[parentIndex] = heap[childIndex]
            parentIndex = childIndex
            childIndex = 2  * childIndex + 1
        }
        //存放最初父节点值
        heap[parentIndex] = temp
    }
    func bulidHeap()  {
        for index in (0...((heap.count - 2 ) / 2)).reversed() {
            downAdjust(index, length: heap.count)
        }
    }
}
extension PriorityQueue : CustomStringConvertible {
    var description: String{
        return heap.description
    }
}

let array = [1,3,10,5,2,8,9,6,4,11,23]
//let heap = BinaryHeap<Int>(array)
//heap.description
//heap.minData()
//heap.insert(-1)
//heap.delete()
//heap.delete()
//heap.insert(1)
//heap.heapSort()
let maxHeap = BinaryMaxHeap(array)
maxHeap.description
maxHeap.heapSort()
let prioprity = PriorityQueue(array, priorityFunction: >)
prioprity.enQueue(100)
//prioprity.deQueue()
//prioprity.deQueue()
//prioprity.deQueue()
//prioprity.deQueue()
prioprity.enQueue(200)
prioprity.enQueue(2)
prioprity.enQueue(20)

prioprity.enQueue(201)
prioprity.enQueue(27)

prioprity.description

//[100, 7, 1, 3, 10, 5, 2, 8, 9, 6, 4, 11, 23]
//[100, 7, 1, 3, 10, 5, 2, 8, 9, 6, 4, 11, 23]
//: [Next](@next)
