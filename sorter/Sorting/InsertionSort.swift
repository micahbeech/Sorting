//
//  InsertionSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import Foundation

class InsertionSort : Sorter {
    
    /*
     Insertion sort:
       - Assume the first i elements in the array are sorted
       - Compare element i + 1 with the first i elements until its proper place is found
       - Insert it at that place
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
        
        // Remove the item and find its proper place in the array
        var index = nextIndex
        let val = items.remove(at: nextIndex)
        for i in 0..<nextIndex {
            if val < items[i] {
                index = i
                break
            }
        }
        
        // Insert the item at the proper place
        items.insert(val, at: index)
        nextIndex += 1
    }
    
    func reset() {
        isDone = false
        nextIndex = 0
    }
    
}
