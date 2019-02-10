//
//  QuickSort.swift
//  Sorting
//
//  Created by kolch_a on 06/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Быстрая сортировка

import Foundation

// универсальная,  через джинерики и рекурсию
public var countQS = 0

func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    countQS += 1 // счетчик
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}



