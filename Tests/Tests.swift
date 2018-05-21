//
//  Tests.swift
//  Tests
//
//  Created by kyi moe cho on 2018-05-21.
//  Copyright © 2018 Zabu. All rights reserved.
//

import XCTest
@testable import Heap

class Tests: XCTestCase {
    
    let myHeap:Heap<Double> = Heap([3.1,1.2,2.2,1.0])
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testInitialConditionPeek() {
        
        do {
            try XCTAssert(myHeap.peek() == 1)
        } catch {
        
        }
        
    }
    
    func testPool() {
        
        do {
            try XCTAssert(myHeap.pool() == 1)
        } catch {
            
        }
    }
    
    
    
    func testAdd() {
        
        myHeap.add(0.5)
        
        do {
            try XCTAssert(myHeap.peek() == 0.5)
        } catch {
            
        }
        
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
