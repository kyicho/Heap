//
//  Heap.swift
//  Swift adaption of MinHeap implementation based on
//  Gayle Laakmann McDowell from HackerRank and modfied it to handle different number types
//  Created by kyi moe cho on 2018-05-18.
//  Copyright © 2018 Zabu. All rights reserved.
//


enum CustomError: Error {
    case runtimeError(String)
}

class Heap<T:Numeric & Comparable> {
    var array:[T]
    
    init() {
        array = []
    }
    
    init(_ dataset: [T]) {
        array = dataset
        array.sort() // average performance O(n Log n). Supposedly use Intro sort
    }
    
    // Check if there's a left child
    func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < array.count
    }
    
    // Check if there's a right child
    func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < array.count
    }
    
    // Returns parent index
    func getParentIndex(_ index: Int) -> Int {
        return (index-1)/2
    }
    
    // Returns left child
    func getLeftChildIndex(_ index: Int) -> Int { return (index*2 + 1) }
    
    // Returns Right child
    func getRightChildIndex(_ index: Int) -> Int { return (index*2 + 2) }
    
    // Swap two nodes
    func swap(_ target1Index:Int, target2Index:Int) {
        let temp = array[target1Index]
        array[target1Index] = array[target2Index]
        array[target2Index] = temp
    }
    
    // Returns first element without removing
    func peek() throws -> T {
        if array.count == 0 {
            throw CustomError.runtimeError("Invalid array index")
        }
        
        return array[0]
    }
    
    // Remove the first element and returns it
    func pool() throws -> T {
        if  array.count == 0 {
            throw CustomError.runtimeError("Invalid array index")
        }
        
        let element = array[0]
        array[0] = array[array.count-1]
        heapifyDown()
        
        return element
    }
    
    // Check if a node has a parent
    func hasParent(_ index: Int) -> Bool {
        if getParentIndex(index) < 0 {
            return false
        }
        return true
    }
    
    private func heapifyDown() {
        var index = 0
        
        while(hasLeftChild(index)) {
            
            var smallerIndex = getLeftChildIndex(index)
            
            if (hasRightChild(index) && (array[smallerIndex] > array[getRightChildIndex(index)])) {
                smallerIndex = getRightChildIndex(index)
            }
            
            if array[smallerIndex] < array[index] {
                swap(smallerIndex, target2Index: index)
                index = smallerIndex
            } else {
                break
            }
        }
    }
    
    func heapifyUp() {
        var index = array.count - 1
        
        while(hasParent(index) && (array[index] < array[getParentIndex(index)])) {
            swap(index, target2Index: getParentIndex(index))
            index = getParentIndex(index)
        }
    }
    
    func add(_ value: T) {
        array.append(value)
        heapifyUp()
    }
    
    
}
