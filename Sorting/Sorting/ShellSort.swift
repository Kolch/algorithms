//
//  ShellSort.swift
//  Sorting
//
//  Created by kolch_a on 07/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

import Foundation

public var countSS = 0

public func shellSort(_ list : inout [Int]) {
    var sublistCount = list.count / 2
    
    while sublistCount > 0 {
        countSS += 1 // счетчик
        
        for var index in 0..<list.count {
            
            guard index + sublistCount < list.count else { break }
            
            if list[index] > list[index + sublistCount] {
                list.swapAt(index, index + sublistCount)
            }
            
            guard sublistCount == 1 && index > 0 else { continue }
            
            while index > 0 && list[index - 1] > list[index] {
                countSS += 1 // счетчик
                
                list.swapAt(index - 1, index)
                index -= 1
            }
        }
        sublistCount = sublistCount / 2
    }
}
