//
//  FIFOQueue.swift
//  Queue
//
//  Created by yuanpinghua on 2020/3/7.
//  Copyright © 2020 yuanpinghua. All rights reserved.
//

import Foundation
///一个能将元素入队和出队的类型
protocol Queue {
    ///在self中持所有元素类型
    associatedtype Element
    ///将newElement入队到self中
    mutating func enqueue(_ newElement: Element)
    ///从self中出队一个元素
    mutating func dequeue() -> Element?
}

struct FIFOQueue<Element>: Queue {
    
    fileprivate var left:[Element] = []
    fileprivate var right:[Element] = []
    mutating func enqueue(_ newElement: Element) {
        right.append(newElement)
    }
    mutating func dequeue() -> Element? {
        if left.isEmpty {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

extension FIFOQueue: Collection {
    typealias Index = Int
    var startIndex: FIFOQueue<Element>.Index {
        return 0
    }
    var endIndex: FIFOQueue<Element>.Index {
        return left.count + right.count
    }
    typealias Indices = CountableRange<Int>
    var indices: Indices{
        return startIndex..<endIndex
    }
    func index(after i: Int) -> Int {
        precondition(i < endIndex)
        return i + 1
    }
    subscript(position: Int) -> Element {
        precondition((0..<endIndex).contains(position), "Index out of bounds")
        if position < left.endIndex{
            return left[left.count - position - 1]
        }else {
            return right[position - left.count]
        }
    }
    
}

extension FIFOQueue: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    init(arrayLiteral elements: Self.ArrayLiteralElement...) {
        self.left = elements.reversed()
        self.right = []
    }
}

