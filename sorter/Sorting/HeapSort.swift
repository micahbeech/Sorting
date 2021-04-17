//
//  HeapSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-16.
//

import Foundation

class HeapSort : Sorter {
    
    /*
     Heap sort:
       - Turn the array into a heap using heapify
       - Repeatedly delete max until the heap is empty
     */
    
    var isDone = false
    var stepDelay = 7
    
    var k = 0 // index to fix down from
    var n = 0 // current size of heap
    var i = 0 // current heapify index
    var fixingDown = false
    
    func step(_ items: inout [Int]) {
        
        // Just starting, setup initial values
        if n == 0 {
            n = items.count
            i = parent(last(n))
        }

        // We are fixing down, execute that step
        if fixingDown {
            stepFixDown(&items)
            
        // Heapify
        } else if i >= 0 {
            k = i
            i -= 1
            fixingDown = true
            
        // Exit case
        } else if n <= 1 {
            isDone = true
            
        // Delete max from heap
        } else {
            k = root()
            items.swapAt(root(), last(n))
            n -= 1
            fixingDown = true
            
        }

    }
    
    func stepFixDown(_ items: inout [Int]) {
        
        if !isLeaf(k) {
            var j = leftChild(k)
            // Take larger of two children
            if j != last(n) && items[j+1] > items[j] {
                j += 1
            }
            
            // If we are larger, we can stop fixing down
            if items[k] >= items[j] {
                fixingDown = false
                return
            }
            
            // Swap places with child and repeat
            items.swapAt(j, k)
            k = j
            
        } else {
            // We are a child, done fixing down
            fixingDown = false
        }
    }
    
    func reset() {
        isDone = false
        k = 0
        n = 0
        i = 0
        fixingDown = false
    }
    
    // MARK: Helper functions for heap
    
    func parent(_ i: Int) -> Int {
        return i % 2 == 0 ? i / 2 - 1 : i / 2
    }
    
    func leftChild(_ i: Int) -> Int {
        return 2 * i + 1
    }
    
    func last(_ i: Int) -> Int {
        return i - 1
    }
    
    func root() -> Int {
        return 0
    }
    
    func isLeaf(_ i: Int) -> Bool {
        return leftChild(i) >= n
    }
    
}
