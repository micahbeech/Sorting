//
//  QuickSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-18.
//

import Foundation

class QuickSort : Sorter {
    
    /*
     Quick sort:
       - Choose a random element of the array
       - Partition the array into all elements less than, equal to, and greater than the chosen element
       - Repeat on the smaller partitions
       - Once the partitions are small enough, just insertion sort
           - This will be quick since items are already close to their correct positions
     */
    
    var isDone = false
    var stepDelay = 10
    let RANDOM_CUTOFF = 10
    
    // Quicksort state
    var S = [(Int, Int)]()
    var i = 0
    var r = 0
    var l = 0
    var step0 = false
    var step1 = false
    var step2 = false
    
    // Partitioning state
    var partitioning = false
    var midPartitioning = false
    var p = 0
    var j = 0
    var v = 0
    
    // Insertion state
    var inserting = false
    var nextIndex = 0
    
    func step(_ items: inout [Int]) {
        if inserting {
            insertionStep(&items)
        } else if partitioning {
            partitionStep(&items)
        } else if step0 {
            quickStep0(&items)
        } else if step1 {
            quickStep1(&items)
        } else if step2 {
            quickStep2(&items)
        } else {
            // First iteration, initialize the stack
            S.append((0, items.count - 1))
            step0 = true
        }
    }
    
    func quickStep0(_ items: inout [Int]) {
        // If there are no more ranges, insertion sort
        if S.isEmpty {
            inserting = true
            return
        }
        
        // Setup the next range and call step 1
        let pair = S.removeLast()
        l = pair.0
        r = pair.1
        step0 = false
        step1 = true
    }
    
    func quickStep1(_ items: inout [Int]) {
        // If we are in the cutoff, choose a pivot and partition
        if r - l >= RANDOM_CUTOFF {
            p = choosePivot(start: l, end: r)
            step1 = false
            partitioning = true
            
        // Otherwise, go back to step 0
        } else {
            step1 = false
            step0 = true
        }
    }
    
    func quickStep2(_ items: inout [Int]) {
        // Setup the next range
        if (i-l > r-i) {
            S.append((l, i-1))
            l = i + 1
        } else {
            S.append((i+1, r))
            r = i-1
        }
        
        // Return to step 1
        step2 = false
        step1 = true
    }
    
    func partitionStep(_ items: inout [Int]) {
        // If we already started partitioning, continue
        if midPartitioning {
            // Get next indices
            repeat { i += 1 } while (i < r + 1 && items[i] < v)
            repeat { j -= 1 } while (j > l && items[j] > v)
            
            // If we crossed, we are done, so swap last elements and go to step 2
            if i >= j {
                items.swapAt(l, i)
                midPartitioning = false
                partitioning = false
                step2 = true
                
            // We didn't cross, swap and keep partitioning
            } else {
                items.swapAt(i, j)
            }
            
        // We haven't started partitioning, set up the necessary values
        } else {
            i = l - 1
            j = r
            v = items[r]
            items.swapAt(r, p)
            midPartitioning = true
        }
    }
    
    func insertionStep(_ items: inout [Int]) {
        // If we have gotten through the whole array, we're sorted
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
    
    func choosePivot(start: Int, end: Int) -> Int {
        // Return a random pivot (selection heuristics could vary)
        return .random(in: start..<end)
    }
    
    func reset() {
        isDone = false
        
        S.removeAll()
        i = 0
        r = 0
        l = 0
        step0 = false
        step1 = false
        step2 = false
        
        inserting = false
        nextIndex = 0
        
        partitioning = false
        p = 0
    }
    
}
