//
//  breadthSearch.swift
//  Graphs
//
//  Created by kolch_a on 05/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Обход в ширину

func breadthSearch(_ graph: Graph, source: Node) -> [String] {
    var queue = Queue<Node>() // очередь
    queue.addToQueue(source)
    
    var nodesExplored = [source.name] // массив с найденными узлами
    source.visited = true
    
    while let node = queue.removeFromQueue() {
        for side in node.neighbors {
            let neighborNode = side.neighbor
            if !neighborNode.visited { // если узел не посещенный добавляем в очередь
                queue.addToQueue(neighborNode)
                neighborNode.visited = true
                nodesExplored.append(neighborNode.name)
            }
        }
    }
    
    return nodesExplored
}
