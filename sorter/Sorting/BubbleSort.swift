//
//  BubbleSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-16.
//

import Foundation

class BubbleSort : Sorter {
    
    /*
     Bubble sort:
       - Assume the last i elements in the array are sorted
       - Take element j = i - 1
       - While j >= j + 1, swap(j, j+1)
       - Repeat
     */
    
    var isDone = false
    var stepDelay = 1
    var nextIndex = Int.max
    var current = Int.max
    
    func step(_ items: inout [Int]) {
        if nextIndex == 0 {
            isDone = true
            return
        }
        
        // Check if this is the first round and setup accordingly
        if nextIndex == Int.max {
            nextIndex = items.count - 1
            current = items.count - 1
        }
        
        // The item hath bubbled, reset
        if current >= items.count {
            nextIndex -= 1
            current = nextIndex
        }
        
        // We hath finished
        if current == 0 {
            isDone = true
            return
        }
        
        // Bubble if needed or move on
        if items[current - 1] > items[current] {
            items.swapAt(current - 1, current)
            current += 1
        } else {
            nextIndex -= 1
            current = nextIndex
        }

    }
    
    func reset() {
        isDone = false
        nextIndex = Int.max
    }
    
}
