//
//  List.swift
//  Queue
//
//  Created by yuanpinghua on 2020/3/8.
//  Copyright © 2020 yuanpinghua. All rights reserved.
//

import Foundation

/// 一个简单的链表枚举
enum List<Element> {
    case end
    indirect case node(Element, next: List<Element>)
    //Indirect 关键字允许一个枚举成员能够持有引用
}
extension List {
    
    /// 在链表前方添加一个值X节点，并返回链表
    /// - Parameter x: 节点X
    func cons(_ x: Element) -> List {
        return .node(x , next: self)
    }
}
extension List: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    init(arrayLiteral elements: Self.ArrayLiteralElement...) {
        self = elements.reversed().reduce(.end, { (list, element) in
            list.cons(element)
        })
    }
}


/// 一个进栈和了栈都是常数时间操作的后进先出的栈（LIFO）
protocol Stack {
    ///栈中存储元素的类型
    associatedtype Element
    
    /// 将X入栈到self作为栈木顶元素
    /// - Parameter x: 元素
    /// - 复杂度： O(1)
    mutating func push(_ x: Element)
    /// 从self移除栈顶元素，并返回它
    /// 如果self是空，则返回nil
    /// - 复杂度 O（1）
    mutating func pop() -> Element? 
}
extension Array : Stack {
    mutating func push(_ x: Element) {
        append(x)
    }
    
    mutating func pop() -> Element? {
        return popLast()
    }
}
extension List: Stack {
    mutating func push(_ x: Element) {
        self = self.cons(x)
    }
    
    mutating func pop() -> Element? {
        switch self {
            case .end:
                return nil
            case let  .node(x, next: xs): 
                self  = xs 
                return x 
        }
    }
}
extension List: Sequence, IteratorProtocol{
    mutating func next() -> Element? {
        return self.pop()
    }
}
fileprivate enum ListNode<Element> {
    case end
    indirect case node(Element, next: ListNode<Element>)
    func cons(_ x : Element) -> ListNode<Element> {
        return .node(x, next: self)
    }
}
public struct ListIndex<Element>: CustomStringConvertible {
    public var description: String
    {
        return "listIndex:\(tag)"
    }
    fileprivate let node: ListNode<Element>
    fileprivate let tag :Int
    
}
extension ListIndex: Comparable {
static public func == <T>(lhs: ListIndex<T>,rhs:ListIndex<T>) -> Bool {
        return lhs.tag == rhs.tag
    }
static public func < <T>(lhs: ListIndex<T>,rhs:ListIndex<T>) -> Bool {
    //startIndex的tage最大，endIndex最小
        return lhs.tag > rhs.tag
    }
} 
public struct SList<Element>: Collection {
    public typealias Index = ListIndex<Element> 
    public var startIndex:Index
    public var endIndex: Index
    public subscript(position: ListIndex<Element>) -> Element{
        switch position.node {
            case .end:
                fatalError("Subscript out of range")
            case  let .node(x, next: _):
            return x
        }
    }
    public func index(after i: Index) -> Index {
        switch i.node {
            case .end:
            fatalError("Subscript out of range")
            case let .node(_, next: next):
                return Index(node: next, tag: i.tag - 1)
        }
    }
}
extension SList: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element
    public init(arrayLiteral elements: Self.ArrayLiteralElement...) {
        startIndex = ListIndex(node: elements.reversed().reduce(.end, { (rs , element) in
            rs.cons(element)
            
        }), tag: elements.count) 
        endIndex = ListIndex(node: .end, tag: 0)
    }
}

extension SList: CustomStringConvertible {
    public var description: String{
        let elements = self.map { String(describing: $0)
        }.joined(separator: ",")
        return "List:\(elements)"
    }
}
extension SList{
    public var count: Int{
        return startIndex.tag - endIndex.tag
    }
}
