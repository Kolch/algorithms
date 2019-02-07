//
//  CountingSort.swift
//  Sorting
//
//  Created by kolch_a on 06/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Сортировка подсчетом
public var countCS = 0

func countingSort(_ array: [Int])-> [Int] {
    
    guard array.count > 0 else {return []}
    
    // Создаем массив для хранения счетчиков для каждого элемента
    
    let maxElement = array.max() ?? 0
    
    var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
    for element in array {
        countCS += 1 // счетчик
        countArray[element] += 1
    }
    
    // Устанавливаем каждое значение как сумму двух предыдущих
    
    for index in 1 ..< countArray.count {
        countCS += 1 // счетчик
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }
    
    //print(countArray)
    
    // Ставим элемент в конечный массив, в соответствии количеству элементов перед ним
    
    var sortedA = [Int](repeating: 0, count: array.count)
    for element in array {
        countCS += 1 // счетчик
        countArray[element] -= 1
        sortedA[countArray[element]] = element
    }
    return sortedA
}
