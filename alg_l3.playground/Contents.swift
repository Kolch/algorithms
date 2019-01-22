//: Playground - noun: a place where people can play

// Kolchedantsev Alexey
// Для наглядности буду сортировать один массив "initialArray" разными методами
import UIKit

let initialArray = [4,1,41,7,9,5,-2,-5,0]
// 1
// Стандартная пузырьковая сортировка

var array = initialArray
var count = 0 // счетчик
for _ in 0..<array.count {
    for j in 1..<array.count {
        count += 1
        if array[j] < array[j-1] {
            let tmp = array[j-1]
            array[j-1] = array[j]
            array[j] = tmp
        }
    }
}
print(array)
print("Кол-во операций - ", count)

//Оптимизированный пузырек

var array1 = initialArray
var count1 = 0
for i in 0..<array1.count {
    for j in 1..<array1.count - i {
        count1 += 1
        if array1[j] < array1[j-1] {
            let tmp = array1[j-1]
            array1[j-1] = array1[j]
            array1[j] = tmp
        }
    }
}
print(array1)
print("Кол-во операций - ", count1)

// 2
//Шейкер
var array2 = initialArray
var l = array2.count
var count2 = 0
var i = 0
while i < l {
    var j = i + 1
    while j < l {
        count2 += 1
        if array2[j] < array2[j-1] {
            let t = array2[j]
            array2[j] = array2[j-1]
            array2[j-1] = t
        }
        j += 1
    }
    l -= 1
    var k = l - 1
    while k > i {
        if array2[k] < array2[k-1] {
            let t = array2[k]
            array2[k] = array2[k-1]
            array2[k-1] = t
        }
        k -= 1
    }
    i += 1
}
print(array2)
print("Кол-во операций - ", count2)

//3 Бинарный поиск
// Доп функции - .lowerBound = нижняя граница спектра, .upperBound = верхняя граница спектра
// A - с рекурсией

print("Бин. поиски")
print("---------------------")
let searchArr = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
print(searchArr)

func BinSearchReq(_ arr: Array<Int>, value: Int, range: Range<Int>) -> Int {
    if range.lowerBound >= range.upperBound {
        return -1
    } else {
    let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    if arr[mid] > value {
        return BinSearchReq(arr, value: value, range: range.lowerBound..<mid)
    } else if arr[mid] < value {
        return BinSearchReq(arr, value: value, range: mid + 1..<range.upperBound)
    } else {
        return mid
        }
    }
}
let v = 53 // искомый элемент
print(v,"- index:", BinSearchReq(searchArr, value: v, range: 0..<searchArr.count))

//B - через цикл
func BinSearchSimple(_ arr: Array<Int>, value: Int, range: Range<Int>) -> Int {
    var lowerBound = 0
    var upperBound = arr.count
    while lowerBound < upperBound {
        let mid = lowerBound + (upperBound - lowerBound) / 2
        if arr[mid] == value {
            return mid
        } else if arr[mid] < value {
            lowerBound = mid + 1
        } else {
            upperBound = mid
        }
    }
    return -1
}

let b = 41
print(b,"- index:", BinSearchSimple(searchArr, value: b, range: 0..<searchArr.count))


/* 4 Оценка сложностей сортировок

Ас. сложность пузырькового алг. - О(n^2 - n)
Размер сортируемого массива = 9
 
Сортировка № 1 совершила 72 итер.
 72 = 9^2 - 9
 72 = 72
 
 Сортировка № 2 совершила 36 итер.
 36 = 1/2(9^2 - 9) - соответсвенно его сложность O(1/2(n^2 - n))
 
 Сортировка № 3(Шейкер) совершила 20 итер., сложность шейкерной сортировки - O(1/2(n^2 - n))
 
 20 < 1/2(9^2 - 9)
 
 
 ВЫВОД: каким то образом оптимизируя пузырек, я добился такой же сложности как и у шейкера...
 */
