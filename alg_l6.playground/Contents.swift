import UIKit
//Kolchedanstev Alexey
// Большую часть времени была потрачена на создание дерева, хеш-функция не соответсвует требованиям...
/*
 Двоичное дерево поиска используя value тип
 Древо неизменное, любые добавления или удаления создают новое древо
 */

public enum BinarySearchTree<T: Comparable> {
    case empty
    case leaf(T)
    indirect case node(BinarySearchTree, T, BinarySearchTree)
    
    /* Сколько веток в дереве */
    public var count: Int {
        switch self {
        case .empty: return 0
        case .leaf: return 1
        case let .node(left, _, right): return left.count + 1 + right.count
        }
    }
    
    /* Высота древа */
    public var height: Int {
        switch self {
        case .empty: return 0
        case .leaf: return 1
        case let .node(left, _, right): return 1 + max(left.height, right.height)
        }
    }
    
    /*
     Добавление элемента
     */
    public func add(newValue: T) -> BinarySearchTree {
        switch self {
        case .empty:
            return .leaf(newValue)
            
        case .leaf(let value):
            if newValue < value {
                return .node(.leaf(newValue), value, .empty)
            } else {
                return .node(.empty, value, .leaf(newValue))
            }
            
        case .node(let left, let value, let right):
            if newValue < value {
                return .node(left.add(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.add(newValue: newValue))
            }
        }
    }
    
    /*
     Поиск.
     Находит первый узел с искомым значением
     */
    public func search(x: T) -> BinarySearchTree? {
        switch self {
        case .empty:
            return nil
        case .leaf(let y):
            return (x == y) ? self : nil
        case let .node(left, y, right):
            if x < y {
                return left.search(x: x)
            } else if y < x {
                return right.search(x: x)
            } else {
                return self
            }
        }
    }
    /*
     Проверяет есть ли переданное значение в древе
     */
    public func contains(x: T) -> Bool {
        return search(x: x) != nil
    }
    
    /*
     Возвращает левый, низший узел
     */
    public func minimum() -> BinarySearchTree {
        var node = self
        var prev = node
        while case let .node(next, _, _) = node {
            prev = node
            node = next
        }
        if case .leaf = node {
            return node
        }
        return prev
    }
    
    /*
     Возвращает правый, низший узел
     */
    public func maximum() -> BinarySearchTree {
        var node = self
        var prev = node
        while case let .node(_, _, next) = node {
            prev = node
            node = next
        }
        if case .leaf = node {
            return node
        }
        return prev
    }
}

    /*
    Расширение для обработки, и вывода дерева
    */
extension BinarySearchTree: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .empty: return "."
        case .leaf(let value): return "\(value)"
        case .node(let left, let value, let right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}

var tree = BinarySearchTree.leaf(8)
tree = tree.add(newValue: 2)
tree = tree.add(newValue: 5)
tree = tree.add(newValue: 10)
tree = tree.add(newValue: 9)
tree = tree.add(newValue: 1)
tree = tree.add(newValue: 3)
print(tree)
tree = tree.add(newValue: 8)
print(tree)
tree.search(x: 10)
tree.search(x: 1)
tree.search(x: 11)
print(tree.maximum())

print("------------------")

// хэш-функция
//Долго копался с хеш-функциями, в итоге ничего интересного не придумал, делать описанную в дз простейшую хеш-функицю посчитал бессмысленным...

func hashFunc(x: Double) -> Int {
    let m:Double = 41232
    let a = 0.618
    let z = Int(x)
    let y = sqrt(x)
    var h = (m * (a * y)) / sqrt(2.3) * Double(String(z).count)
    return Int(h)
}
var arr:Array<Int> = []
var i = 1
while i < 1000 {
    arr.append(hashFunc(x: Double(i)))
    i += 10
}
for g in arr {
    print(g)
}
