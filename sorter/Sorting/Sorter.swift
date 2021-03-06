//
//  Sorter.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import Foundation

protocol Sorter {
    var isDone: Bool { get }
    var stepDelay: Int { get }
    func step(_ items: inout [Int])
    func reset()
}


func getSorter(algorithm: String) -> Sorter? {
    switch (algorithm) {
    case "Selection":
        return SelectionSort()
    case "Insertion":
        return InsertionSort()
    case "Bogo":
        return BogoSort()
    case "Bubble":
        return BubbleSort()
    case "Merge":
        return MergeSort()
    case "Heap":
        return HeapSort()
    case "Quick":
        return QuickSort()
    default:
        return nil
    }
}
