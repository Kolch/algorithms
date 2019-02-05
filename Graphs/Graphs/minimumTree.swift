//
//  minimumTree.swift
//  Graphs
//
//  Created by kolch_a on 05/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Минимальное дерево

func SearchMinimumTree(graph: Graph, source: Node) -> Graph {
    let minimumTree = graph.duplicate()
    
    var queue = Queue<Node>() // очередь
    let sourceInMinimumTree = minimumTree.findNode(source.name)
    queue.addToQueue(sourceInMinimumTree) // начальный узел
    sourceInMinimumTree.visited = true
    
    while let current = queue.removeFromQueue() {
        for side in current.neighbors {
            let neighborNode = side.neighbor
            if !neighborNode.visited { // если не посещали узел добавляем в очередь
                neighborNode.visited = true
                queue.addToQueue(neighborNode)
            } else {
                current.remove(side) // иначе удаляем
            }
        }
    }
    
    return minimumTree
}
