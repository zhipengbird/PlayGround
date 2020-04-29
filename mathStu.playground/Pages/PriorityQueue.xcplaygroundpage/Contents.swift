//: [Previous](@previous)

import Foundation
struct Heap<Element> {
    var elements:[Element] = []
    let priorityFunction: (Element,Element) -> Bool
    init(elements:[Element] = [],priorityFunction: @escaping(Element,Element)->Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    var count: Int {
        return elements.count
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    
    mutating  func buildHeap()  {
        for index  in (0..<(count/2)).reversed() {
            siftDown(elementsIndex: index)
        }
    }
    mutating func siftUP(elementIndex index: Int){
        let parent = parentIndex(of: index)
        
        guard !isRoot(index) , isHigherPriority(at: index, than: parent) else {
            return
        } 
        elements.swapAt(index, parent)
        siftUP(elementIndex: parent)
        
    }
    mutating func siftDown(elementsIndex index: Int){
        let child = highestPriorityIndex(for: index)
        if index == child {
            return
        }
        elements.swapAt(index, child)
        siftDown(elementsIndex: child)
    }
    mutating func dequeue() -> Element?
    {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        let temp = elements.removeLast()
        if !isEmpty {
            siftDown(elementsIndex: 0)
        }
        return temp
    }
    mutating func enqueue(element: Element) {
        elements.append(element)
        siftUP(elementIndex: count - 1)
    }
    //MARK: - help
    func isRoot(_ index : Int) -> Bool {
        return index == 0
    }
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    func rightChidIndex(of index: Int) -> Int {
        return (2 * index) + 2
     }
    func parentIndex(of index :Int) -> Int {
        return (index - 1) / 2
    }
    func isHigherPriority(at fisrtIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[fisrtIndex],elements[secondIndex])
    }
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count  && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChidIndex(of: parent))
    }
}
extension Heap where Element: Equatable {
    mutating func remove(_ element: Element) {
        guard let index = elements.firstIndex(of: element) else { return  }
        elements.swapAt(index, count - 1)
        elements.removeLast()
        siftDown(elementsIndex: index)
    }
    mutating func boost(_ element: Element) {
        guard let index = elements.firstIndex(of: element) else { return }
        siftUP(elementIndex: index)
    }
}
extension Heap : CustomStringConvertible {
    var description: String {
        return elements.description
    }
}
let array = [1,3,10,5,2,8,9,6,4,11,23,100,233,291,112,113,13434]

var heap = Heap(elements: array, priorityFunction: >)
heap.description
heap.dequeue()
heap.dequeue()
var heap2 = Heap(elements: array, priorityFunction: <)
heap2.description
heap2.dequeue()
heap2.description
heap2.dequeue()
heap2.description
heap2.dequeue()
heap2.description
heap2.dequeue()
//: [Next](@next)
