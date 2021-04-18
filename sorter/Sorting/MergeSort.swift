//
//  MergeSort.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-16.
//

import Foundation

class MergeSort : Sorter {
    
    /*
     Merge sort:
       - Divide the array in half (if necessary give the middle element to the first half)
       - Recursively divide the subarrays until all subarrays have size 1
       - Recursively merge each pair of subarrays in sorted order
       - Repeat until we have one big sorted array
     */
    
    var isDone = false
    var stepDelay = 6
    
    // Variables to store the state of the current step
    var merges = [(Int, Int)]() // The indidces of merges we still need to perform
    var mergeIndices = [Int]() // The order of merges to perform
    var merging = false // If we are in a merging step or not
    var L = [Int]() // Left merge array
    var R = [Int]() // Right merge array
    var i = 0 // Current index in left array
    var j = 0 // Current index in right array
    var k = 0 // Current index in parent array
    
    func step(_ items: inout [Int]) {
        
        // If we're left with one merge and are done merging, we're finished
        if merges.count == 1 && !merging {
            isDone = true
            return
        }

        // If there are no merges, this is the first round so calculate them and the indices
        if merges.isEmpty {
            for i in 0..<items.count {
                merges.append((i, i))
            }
            calcIndices(size: items.count, offset: 0)
        }

        // Perform the step
        if !merging {
            setMerge(&items)
        } else {
            stepMerge(&items)
        }

    }
    
    /// Calculate the order of merges we access while sorting
    func calcIndices(size: Int, offset: Int) {
        if size <= 1 {
            return
        }
        
        let a = size % 2 == 0 ? size / 2 : size / 2 + 1
        let b = size / 2
        calcIndices(size: a, offset: offset)
        calcIndices(size: b, offset: offset + 1)
        mergeIndices.append(offset)
        
    }
    
    /// Select the next two subarrays to merge.
    func setMerge(_ items: inout [Int]) {
        
        let mergeIndex = mergeIndices.removeFirst()
        let merge1 = merges.remove(at: mergeIndex)
        let merge2 = merges.remove(at: mergeIndex)
        merges.insert((merge1.0, merge2.1), at: mergeIndex)

        let l = merge1.0
        let m = merge1.1
        let r = merge2.1

        L = []
        R = []
        for i in 0..<m-l+1 {
            L.append(items[l+i])
        }
        for i in 0..<r-m {
            R.append(items[m+1+i])
        }
        
        i = 0
        j = 0
        k = l
        
        merging = true
        
    }
    
    /// Increase merge of the `L` and `R` by one step.
    func stepMerge(_ items: inout [Int]) {
        
        if i < L.count && j < R.count {
            if (L[i] <= R[j]) {
                items[k] = L[i]
                i += 1
            } else {
                items[k] = R[j]
                j += 1
            }
            k += 1
            
        } else if  i < L.count {
            items[k] = L[i]
            i += 1
            k += 1
            
        } else if j < R.count {
            items[k] = R[j]
            j += 1
            k += 1
            
        } else {
            merging = false
            
        }
        
    }
    
    func reset() {
        isDone = false
        merges.removeAll()
        mergeIndices.removeAll()
        merging = false
        L.removeAll()
        R.removeAll()
        i = 0
        j = 0
        k = 0
    }
    
}
