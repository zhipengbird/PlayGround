//
//  QueueTests.swift
//  QueueTests
//
//  Created by yuanpinghua on 2020/3/7.
//  Copyright © 2020 yuanpinghua. All rights reserved.
//

import XCTest
@testable import Queue

class QueueTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var queue = FIFOQueue<Int>()
        for i  in 0...10 {
            queue.enqueue(i)
        }
        for value in queue {
            print(value)
        }
        let queue1 = [2,3,4,5,66,1,3,35,8]
        for value in queue1 {
            print(value)
        }
        
    }
    func testList() {
        var list = List<Int>.end.cons(1).cons(2).cons(3)
        var listb = list
        print(list.pop()) 
        print(list.pop()) 

        print(list.pop()) 

        print(list.pop()) 
        print(listb.pop())
        print(listb.pop())
        print(listb.pop())
        print(listb.pop())

        var array: Array<Int> = [1,3,4,5,6]
//        print(array.pop())
//        print(array.pop())
//
//        print(array.pop())
//
//        print(array.pop())
//
//        print(array.pop())
//        print(array.pop())
        for value in array {
            print(value)
        }


//        let list22: SList<Int> = [1,3,4,5,6]
//        print(list22.)
    }

    func testsList() {
        let r: SList<Int> = [1,3,4,5,6,6]
        print(r.count)
        print(r.first)
        
        print(r.index(r.startIndex, offsetBy: 1, limitedBy: r.endIndex))
        print(r[r.index(after: r.startIndex)])
        print(r.index(after: r.startIndex))
        for value in r {
            print(value)
        }
        print(r.count)
        print(r)
        
    }
    func testdisptach() {
        let exception  = self.expectation(description: "nn")
        self.perform(#selector(run(value:)), with: "lalal", afterDelay: 2)
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)
        let item = DispatchWorkItem { 
            queue.asyncAfter(deadline: .now() + 6) { 
                self.run(value: "hahah")
                exception.fulfill()
            }
        }
        queue.async(group: group, execute: item)
        self.wait(for: [exception], timeout: 10)
    }
   @objc func run(value: String?)  {
    print(value ?? "")
    print(Thread.current)

    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
