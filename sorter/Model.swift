//
//  Model.swift
//  sorter
//
//  Created by Micah Beech on 2021-04-15.
//

import Foundation

class Model : ObservableObject {
    
    var ITEM_MIN = 1
    var ITEM_MAX = 100
    var TIMER_DELAY = 100
    
    @Published var items = [Int]()
    @Published var maxItem = 1
    
    var timer = Timer()
    var sortTime = 0
    var sorter: Sorter!
    var numItems: Int
    
    init(arraySize: Int, algorithm: String) {
        self.numItems = arraySize
        self.sorter = getSorter(algorithm: algorithm)
        self.ITEM_MAX = arraySize
        
        self.TIMER_DELAY = sorter.stepDelay * MAX_ARRAY_SIZE / arraySize
        
        self.resetItems()
    }
    
    func resetItems() {
        if timer.isValid { timer.invalidate() }
        sortTime = 0
        sorter.reset()
        items.removeAll()
        if numItems < 1 { return }
        for _ in 1...numItems {
            items.append(.random(in: ITEM_MIN...ITEM_MAX))
        }
        maxItem = items.max()!
    }
    
    func sort() {
        sortTime = 0
        timer = Timer.scheduledTimer(
            timeInterval: 1 / Double(MS_IN_SEC),
            target: self,
            selector: #selector(timerFired),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func timerFired() {
        if sorter.isDone {
            if timer.isValid { timer.invalidate() }
            return
        }
        if sortTime % TIMER_DELAY == 0 {
            sorter.step(&items)
        }
        sortTime += 1
    }
    
}
