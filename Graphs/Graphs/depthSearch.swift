//
//  depthSearch.swift
//  Graphs
//
//  Created by kolch_a on 05/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//
// Обход в глубину через цикл
func depthFirstSearch(_ graph: Graph, source: Node) -> [String] {
    var nodesExplored = [source.name]
    source.visited = true
    
    for side in source.neighbors {
        if !side.neighbor.visited {
            nodesExplored += depthFirstSearch(graph, source: side.neighbor)
        }
    }
    return nodesExplored
}
