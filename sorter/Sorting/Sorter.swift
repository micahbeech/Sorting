//
//  Sorter.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import Foundation

let SORTING_ALGORITHMS = [
    "Selection",
    "Insertion",
    "Bogo",
    "Bubble"
]

func getSorter(algorithm: String) -> Sorter? {
    if algorithm == "Selection" {
        return SelectionSort()
    } else if algorithm == "Insertion" {
        return InsertionSort()
    } else if algorithm == "Bogo" {
        return BogoSort()
    } else if algorithm == "Bubble" {
        return BubbleSort()
    }
    
    return nil
}

protocol Sorter {
    var isDone: Bool { get }
    var stepDelay: Int { get }
    func step(_ items: inout [Int])
    func reset()
}
