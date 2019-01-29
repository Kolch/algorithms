//Kolchedantsev Alexey

import UIKit

// 1
var stack: Array<String> = []
let maxSize = 10000

func push(value: String) {
    if stack.count < maxSize {
        stack.append(value)
    }
}

func pop() -> String {
    if stack.count != 0 {
    let result =  stack.popLast()
        return result!
    } else {
        return ""
    }
}

func transform(digit: Int) -> String {
    var result = ""
    var i = digit
    while i != 0 {
        let x = i % 2
        i = i / 2
        push(value: String(x))
    }
    
    for _ in stack {
        result += pop()
    }
    return result
}
let digit = 321 // Начальное число
//print(transform(digit: digit)) // Вывод переведенного числа

// 3

let str = "({}[])" // задаем последовательность


func check(str: String) -> Bool {
    var i = 0
    while i < str.count {
        let char = str[str.index(str.startIndex, offsetBy: i)]
        
        // вытаскиваю элементы из строки по одному и кидаю в стек столько левые скобки
        
        if (String(char) == "(") || (String(char) == "{") || (String(char) == "[") {
            push(value: String(char))
        } else {
            let lastChar = stack[stack.count - 1]
            
            // если правая скобка такого же типа как и последняя в стеке, то делаем pop()
            
            if (lastChar == "{" && String(char) == "}") || (lastChar == "[" && String(char) == "]") || (lastChar == "(" && String(char) == ")") {
               stack.popLast()
            }
        }
        i += 1
    }
    
    if stack.isEmpty { // если стек пустой - последовательность правельная
        return true
    } else {
        return false
    }
}
print(check(str: str))

// 6
// Сделал структуру очереди для интов, при желании можно сделать для всех типов через дженерики
struct Queue {
    private var items: Array<Int> = []
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var count: Int { // возвращает кол-во элементов
        return items.count
    }
    
    mutating func enque(_ item: Int) { // добавляем в очередь
        items.append(item)
    }
    
    mutating func deque() -> Int? { // вытаскиваем и удаляем из очереди
        return items.removeFirst()
    }
    
    subscript (idx: Int) -> Int? { // subscript - чтобы проще вызывать экземпляр структуры, и проверка на правильность индекса
        guard idx < items.count else {
            return nil
        }
        return items[idx]
    }
}

var a = Queue()
a.enque(2)
a.enque(51)
a.enque(0)
print(a)
a.deque()
print(a)
