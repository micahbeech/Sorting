//
//  SelectionSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import Foundation

class SelectionSort : Sorter {
    
    /*
     Selection sort:
       - Assume the first i elements in the array are sorted
       - Find the smallest element after i in the array
       - Swap that element with element i + 1
       - Repeat
     */
    
    var isDone = false
    var stepDelay = 50
    var nextIndex = 0
    
    func step(_ items: inout [Int]) {
        if items.count <= nextIndex {
            isDone = true
            return
        }
        
        // Find the smallest element in the array
        var min = items[nextIndex]
        var index = nextIndex
        for j in nextIndex+1..<items.count {
            if items[j] < min {
                min = items[j]
                index = j
            }
        }
        
        // Place the smallest element at the current index
        items.swapAt(nextIndex, index)
        nextIndex += 1
    }
    
    func reset() {
        isDone = false
        nextIndex = 0
    }
    
}
