//
//  graph.swift
//  Graphs
//
//  Created by kolch_a on 05/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Класс графа
// Называл методы так чтобы было максимально понятно, не вижу смысла коментировать подробно
public class Graph: CustomStringConvertible, Equatable {
    public private(set) var nodes: [Node] // узлы
    
    public init() {
        self.nodes = []
    }
    
    @discardableResult public func addNode(_ name: String) -> Node {
        let node = Node(name)
        nodes.append(node)
        return node
    }
    
    public func addSide(_ source: Node, neighbor: Node) {
        let edge = Side(neighbor)
        source.neighbors.append(edge)
    }
    
    public var description: String { // вывод
        var description = ""
        
        for node in nodes {
            if !node.neighbors.isEmpty {
                description += "[node: \(node.name) -> : \(node.neighbors.map { $0.neighbor.name})]"
            }
        }
        return description
    }
    
    public func findNode(_ name: String) -> Node {
        return nodes.filter { $0.name == name }.first!
    }
    
    public func duplicate() -> Graph {
        let duplicated = Graph()
        
        for node in nodes {
            duplicated.addNode(node.name)
        }
        
        for node in nodes {
            for side in node.neighbors {
                let source = duplicated.findNode(node.name)
                let neighbour = duplicated.findNode(side.neighbor.name)
                duplicated.addSide(source, neighbor: neighbour)
            }
        }
        
        return duplicated
    }
}

public func == (_ lhs: Graph, rhs: Graph) -> Bool {
    return lhs.nodes == rhs.nodes
}
