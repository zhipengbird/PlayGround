import UIKit

//A cache LRU (Least Recently Used) is similar to a dictionary. It stores data associated to a key. The difference between a dictionary and a Cache is that the latter has a limited capacity. Every time we reach the capacity, the Cache deletes the least recently used element.

/*:
*  Doubly Linked List:  store the elements. Don't user an Array because it would be slower. The cache LRU policy is to move the elements  recently used in the head very offen.
* Dictionary<key,ListNode>: doubley Linked list which its look up complexity is O(n).  Solve this bottleneck using a dictionary. use dictionary to store the node of our list.
 */

typealias DoublyLinkedListNode<T> = DoublyLinkedList<T>.Node<T>
final class DoublyLinkedList<T> {
    final class Node<T>{
        var payload: T 
        var previous: Node<T>?
        var next: Node<T>?
        init(payload: T) {
            self.payload = payload
        }
    }
    private var head: Node<T>?
    private var tail: Node<T>?
    ///< the information of how many elements are stored in the list
    private(set) var count: Int = 0
    
    
    ///< We add it in the head to be compliant with the Cache LRU policy—a new element is the recently used
    /// add element to the head
    /// - Parameter payload: element
    func addHead(_ payload: T) -> Node<T> {
        let node = Node(payload: payload)
        defer {
            head = node
            count += 1
        }
        guard let head = head else {
            //没有元素时，head= tail = node
            tail = node
            return node
        }
        head.previous = node
        node.previous = nil
        node.next = head
        return head
    }
    ///<The concept of a Cache LRU is keeping the recently element used at the beginning of our list
    func moveHead(_ node: Node<T>) {
        guard node !== head else {
            //当前元素就是头元素就不用移动
            return
        }
        let previous = node.previous
        let next  = node.next
        
        previous?.next = next
        next?.previous = previous
        
        node.next = head
        node.previous = nil
        
        if node === tail {
            tail = previous
        }
        self.head = node
    }
    
//    When our Cache is full, we need a method to remove the last element—which is the least recently used:
    func removeLast() -> Node<T>? {
        guard let tail = self.tail else {
            return nil
        }
        let previous = tail.previous
        previous?.next = nil 
        
        
        if count == 1 {
            head = nil 
        }
        count -= 1
        return tail
    }
}
//The generic value Key must be Hashable since it’s the key of the value stored in the doubly linked list.
//A Cache stores data associated to keys like a dictionary. Unfortunately, our doubly linked list accepts only a value payload and not also a key. To solve this problem, we can create a struct which wraps the value and its key. In this way, our list nodes will store the object CachePayload which contains both value and key
final class CacheLRU<Key: Hashable, Value>{
    private struct CachePayload {
        let key: Key
        let value: Value
    }
    
    private let list = DoublyLinkedList<CachePayload>()
    private var nodesDict = [Key:DoublyLinkedListNode<CachePayload>]()
    
    //Cache LRU has a limited capacity
    private let capacity: Int
    
    init(capacity: Int) {
        //use the method max to avoid invalid capacity values less than zero.
        self.capacity = max(0, capacity)
    }
    func setValue(_ value: Value, for key: Key)  {
        
        //1.Create a payload object to wrap key and value to be stored in the list.
        let payload = CachePayload(key: key, value: value)
        
        //2.If the list already stores an element for that specific key, we update the value and move it at the beginning of the list. Otherwise, we create a new node and add it as head of the list.
        if let node = nodesDict[key]  {
            node.payload = payload
            list.moveHead(node)
        } else {
            let node = list.addHead(payload)
            nodesDict[key] = node
        }
        
        //3.If we exceeded the capacity of the cache adding the new element, we remove the last element of the list.
        if list.count > capacity {
            let nodeRemoved = list.removeLast()
            if let key = nodeRemoved?.payload.key{
                nodesDict[key] = nil
            }
        }
    }
    
    ///< we can retrieve an element for a specific key. Every time we retrieve an element, it is moved at the beginning of the list as recently used element:
    func getValue(for key: Key) -> Value? {
        guard let node = nodesDict[key] else { return nil }
        list.moveHead(node)
        return node.payload.value
    }
}


let cache = CacheLRU<Int, String>(capacity: 2)
cache.getValue(for: 4)

cache.setValue("one", for:1)
cache.setValue("Eleven", for: 11)
cache.setValue("Twenty", for: 20)



