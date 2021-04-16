//
//  InsertionSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import Foundation

class InsertionSort : Sorter {
    
    var isDone = false
    var stepDelay = 50
    var nextIndex = 0
    
    func step(_ items: inout [Int]) {
        if items.count <= nextIndex {
            isDone = true
            return
        }
        
        var index = nextIndex
        let val = items.remove(at: nextIndex)
        for i in 0..<nextIndex {
            if val < items[i] {
                index = i
                break
            }
        }
        
        items.insert(val, at: index)
        nextIndex += 1
    }
    
    func reset() {
        isDone = false
        nextIndex = 0
    }
    
}
