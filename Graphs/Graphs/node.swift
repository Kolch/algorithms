//
//  node.swift
//  Graphs
//
//  Created by kolch_a on 05/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Класс узла

public class Node: CustomStringConvertible, Equatable {
    public var neighbors: [Side] // переменная "сосед", для соединенных узлов
    
    public private(set) var name: String
    public var distance: Int?
    public var visited: Bool // флаг, посещали узел или нет
    
    public init(_ name: String) {
        self.name = name
        neighbors = []
        visited = false
    }
    
    public var description: String { // вывод
        if let distance = distance {
            return "Node(name: \(name), distance: \(distance))"
        }
        return "Node(name: \(name), distance: infinity)"
    }
    
    public var hasDistance: Bool {
        return distance != nil
    }
    
    public func remove(_ edge: Side) {
        neighbors.remove(at: neighbors.index { $0 === edge }!)
    }
}

public func == (_ lhs: Node, rhs: Node) -> Bool {
    return lhs.name == rhs.name && lhs.neighbors == rhs.neighbors
}
