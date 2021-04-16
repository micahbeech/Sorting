//
//  BogoSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import Foundation

class BogoSort : Sorter {
    
    /*
     Bogo sort:
       - If the array is sorted, we're done
       - Otherwise, shuffle it
       - Repeat
     */
    
    var isDone = false
    var stepDelay = 5
    
    func step(_ items: inout [Int]) {
        if items.sorted() == items {
            isDone = true
            return
        }
        
        items.shuffle()
    }
    
    func reset() {
        isDone = false
    }
    
}
