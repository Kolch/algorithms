//
//  BubbleSort.swift
//  Sorting
//
//  Created by kolch_a on 07/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Пузырек и оптимизированный пузырек


import Foundation

public var countBS = 0
public func bubbleSort(_ a: Array<Int>) -> Array<Int> {
    array = a
for _ in 0..<array.count {
    for j in 1..<array.count {
        
        countBS += 1 // счетчик
        
        if array[j] < array[j-1] {
            let tmp = array[j-1]
            array[j-1] = array[j]
            array[j] = tmp
        }
    }
}
return array
}
public var countFBS = 0

public func fastBubbleSort(_ a: Array<Int>) -> Array<Int> {
    array = a
    for i in 0..<array.count {
        for j in 1..<array.count - i {
            
            countFBS += 1 // счетчик
            
            if array[j] < array[j-1] {
                let tmp = array[j-1]
                array[j-1] = array[j]
                array[j] = tmp
            }
        }
    }
    return array
}
