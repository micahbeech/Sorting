//
//  BubbleSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-16.
//

import Foundation

class BubbleSort : Sorter {
    
    var isDone = false
    var stepDelay = 1
    var nextIndex = Int.max
    var current = Int.max
    
    func step(_ items: inout [Int]) {
        if nextIndex == 0 {
            isDone = true
            return
        }
        
        if nextIndex == Int.max {
            nextIndex = items.count - 1
            current = items.count - 1
        }
        
        if current >= items.count {
            nextIndex -= 1
            current = nextIndex
        }
        
        if current == 0 {
            isDone = true
            return
        }
        
        if items[current - 1] > items[current] {
            items.swapAt(current - 1, current)
        } else {
            current += 1
        }

    }
    
    func reset() {
        isDone = false
        nextIndex = Int.max
    }
    
}
