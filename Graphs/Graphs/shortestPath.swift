//
//  shortestPath.swift
//  Graphs
//
//  Created by kolch_a on 05/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Кротчайший путь

func shortestPath(graph: Graph, source: Node) -> Graph {
    let shortestPathGraph = graph.duplicate()
    
    var queue = Queue<Node>()
    let sourceInShortestPathsGraph = shortestPathGraph.findNode(source.name)
    queue.addToQueue(sourceInShortestPathsGraph)
    sourceInShortestPathsGraph.distance = 0
    
    while let current = queue.removeFromQueue() {
        for side in current.neighbors {
            let neighborNode = side.neighbor
            if !neighborNode.hasDistance {
                queue.addToQueue(neighborNode)
                neighborNode.distance = current.distance! + 1
            }
        }
    }
    
    return shortestPathGraph
}
