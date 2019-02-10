//
//  ShakeSort.swift
//  Sorting
//
//  Created by kolch_a on 07/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Шейкер

public var countShakeS = 0

func shakeSort(_ a: Array<Int>) -> Array<Int> {
array = a
var l = array.count
var i = 0
while i < l {
    var j = i + 1
    while j < l {
        countShakeS += 1 // счетчик
        if array[j] < array[j-1] {
            let t = array[j]
            array[j] = array[j-1]
            array[j-1] = t
        }
        j += 1
    }
    l -= 1
    var k = l - 1
    while k > i {
        countShakeS += 1 // счетчик
        
        if array[k] < array[k-1] {
            let t = array[k]
            array[k] = array[k-1]
            array[k-1] = t
        }
        k -= 1
    }
    i += 1
}
    return array
}
