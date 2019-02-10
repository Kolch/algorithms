//
//  MergeSort.swift
//  Sorting
//
//  Created by kolch_a on 06/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Cортировка слиянием, через джинерики
// Называл все предельно просто, не посчитал нужным что либо коментировать

public var countMS = 0

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    countMS += 1 // счетчик
    
    guard array.count > 1 else { return array }
    let midIndex = array.count / 2
    let leftA = mergeSort(Array(array[0..<midIndex]))
    let rightA = mergeSort(Array(array[midIndex..<array.count]))
    return merge(left: leftA, right: rightA)
}

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    var newArr: [T] = []
    if newArr.capacity < left.count + right.count {
        newArr.reserveCapacity(left.count + right.count)
    }
    
    while true {
        guard leftIndex < left.endIndex else {
            newArr.append(contentsOf: right[rightIndex..<right.endIndex])
            break
        }
        guard rightIndex < right.endIndex else {
            newArr.append(contentsOf: left[leftIndex..<left.endIndex])
            break
        }
        
        if left[leftIndex] < right[rightIndex] {
            newArr.append(left[leftIndex])
            leftIndex += 1
        } else {
            newArr.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    
    return newArr
}
