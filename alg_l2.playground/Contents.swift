//: Playground - noun: a place where people can play
// Kolchedntsev Alexey

import UIKit

//1. Реализовать функцию перевода из 10 системы в двоичную используя рекурсию
var b = ""
func transform(int: Int) -> String {
    var a = int
    var c: Int
    if a >= 1 {
        c = a % 2
        a = a / 2
        transform(int: a)
        b += String(c)
    }
    else {
        return b
    }
    return b
}
print(transform(int: 132))

//2. Реализовать функцию возведения числа a в степень b
// a)  без рекурсии

func power(a:Int, b:Int) -> String {
    if a == 0 && b == 0 {
        return "Так нельзя!"
    }
    else {
        if b == 0 {
            return String(1)
        }
    var i = b
    var result = a
    while i > 1 {
        result = result * a
        i -= 1
    }
    return String(result)
    }
}
print(power(a: 2, b: 4))

// б) рекурсивно
var result = ""
func powerReq(a:Int, b:Int){
    let v = a
    func req(a:Int, b: Int){
        var z = a
        if b > 1 {
            z = z * v
            let x = b - 1
            req(a: z, b: x)
        }
        else {
            result = String(z)
        }
    }
    if a == 0 && b == 0 {
        result = "Так нельзя!!"
    }
    else {
        if a != 0 && b == 0 {
            result = "1"
        }
        else {
            req(a: a, b: b)
        }
    }
}

powerReq(a: 3, b: 9)
print(result)

// с) рекурсивно, используя свойство чётности степени
// Не хватило времени доделать... Работает только с некоторыми числами правильно, не знаю как стоило писать эту программу(
//var count = 0
//var sqr = 1
//var mult = 0
//var g = 0
//var res = 0
//func fP(a:Int, b: Int){
//    var realA = a
//
//func fastPow(a:Int, b: Int){
//    var s = b
//    if b > 2{
//        count += 1
//    if b % 2 == 0 {
//        s = b / 2
//        sqr += 1
//        fastPow(a: a, b: s)
//    }
//    else {
//        s = b - 1
//        mult += 1
//        fastPow(a: a, b: s)
//    }
//    }
//    else {
//        if sqr > 0{
//            res = (a * a)
//            sqr -= 1
//            if mult > 0 {
//                res = res * realA
//                mult -= 1
//            }
//            fastPow(a: res, b: s)
//        }
//    }
//}
//    fastPow(a: a, b: b)
//}
//var Q = 3
//var q = 10
//fP(a: Q, b: q)
//print(count)
//print(sqr)
//print(res)

//4.
var iter = 0
func Calculation(a: Int, b: Int, string: String) {
    var i = 0
    while i < 2 {
        var s = string
        var n = a
        if i == 0 {
            n += 1
            s += "+1"
        }
        else
        {
            n *= 2
            s += "*2"
        }
        if n < b {
            Calculation(a: n, b: b, string: s)
        }
        else {
            if n == b {
                iter += 1
                print(s , " = ", b)
            }
        }
        i += 1
    }
}
var _a = 3
var _b = 20
Calculation(a: _a, b: _b, string: String(_a))
print("3 -> 20 --", iter, "branches")

