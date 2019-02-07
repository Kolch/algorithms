//
//  main.swift
//  Sorting
//
//  Created by kolch_a on 06/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

/*
 Главный файл
 
 Немного не понял как стоило сделать таблицу, поэтому сделал так:
 В конце файла три таблицы для 100, 10000 и 1000000 входных данных
 Некоторые сортировки не посчитанны для 1000000 в.д. так как занимает неоправданно много времени
 
 Сортировки:
 Все сортировки в отдельных файлах
 Управляется из этого файла
 В кажой сортировке есть собственный счетчкий, все начинаются с "count.."
 
 сортировка подсчетом - countingSort()
 быстрая сортировка - quickSort()
 сортировка слиянием - mergeSort()
 шейкерная сортировка - shakeSort()
 shell sort - shellSort()
 сортировка пузырьком - bubbleSort()
 оптимизированный пузырек - fastBubbleSort()
 */
import Foundation

var array:Array<Int> = []
for _ in Range(1...1000000) { // задаем кол-во входынх данных
    array.append(Int.random(in: 0..<1000))
}

print("Кол-во вхождений", array.count)

// чтобы воспользоваться какой то сортировкой - раскомментируйте

// сортировка подсчетом
//let sorted = countingSort(array)
//print("Кол-во операций", countCS)

// быстрая сортировка
//let sorted = quickSort(array)
//print("Кол-во операций", countQS)

// сортировка слиянием
//let sorted = mergeSort(array)
//print("Кол-во операций", countMS)

// сортировка пузырьком
//let sorted = bubbleSort(array)
//print("Кол-во операций", countBS)

// оптимизированный пузырек
//let sorted = fastBubbleSort(array)
//print("Кол-во операций", countFBS)

// шейкерная сортировка
//let sorted = shakeSort(array)
//print("Кол-во операций", countShakeS)


/*
 --------------------------------------------
ФИО - Колчеданцев Алесксей Юрьевич
Процессор - 2,9 GHz Intel Core i7
ОС - macOS
Среда программирования - Xcode(((

 
 
 Название       Объем входных данных       Кол-во операций
 
 Quick sort    |  100                       63
               |
 Shell sort    |  100                       413
               |
 Merge sort    |  100                       199
               |
 Counting S    |  100                       1173
               |
 Bubble sort   |  100                       9900
 Bubble S(Opt) |  100                       4950
               |
 Shake sort    |  100                       4950
 
 
 
 
 
 Название       Объем входных данных       Кол-во операций
 
 Quick sort    |  10000                     999
               |
 Shell sort    |  10000                     3643175
               |
 Merge sort    |  10000                     19999
               |
 Counting S    |  10000                     20999
               |
 Bubble sort   |  10000                     99990000
 Bubble S(Opt) |  10000                     49995000
               |
 Shake sort    |  10000                     49995000
 
 
 
 
 
 
 Название       Объем входных данных       Кол-во операций
 
 Quick sort    |  1000000                   1000
               |
 Shell sort    |  1000000                   очкнь долго
               |
 Merge sort    |  1000000                   1999999
               |
 Counting S    |  1000000                   2000999
               |
 Bubble sort   |  1000000                   очкнь долго
 Bubble S(Opt) |  1000000                   очкнь долго
               |
 Shake sort    |  1000000                   очкнь долго

 */
