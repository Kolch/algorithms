//
//  main.swift
//  Graphs
//
//  Created by kolch_a on 04/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

/* Рабочий файл
 написал все используя ООП, все разделено на классы
 все работает кроме обхода в ширину, в процессе доработки, гдето допустил логическую ошибку, пока не нашел
 обхода графа в глубину - depthFirstSearch()
 обхода графа в ширину - breadthFirstSearch()
 для поиска минимального дерева - SearchMinimumTree()
 для поиска наименьшего пути - shortestPath()
 */
// Создаем граф, узлы и связи
let graph = Graph()



let nodeA = graph.addNode("a")
let nodeB = graph.addNode("b")
let nodeC = graph.addNode("c")
let nodeD = graph.addNode("d")
let nodeE = graph.addNode("e")
let nodeF = graph.addNode("f")
let nodeG = graph.addNode("g")
let nodeH = graph.addNode("h")
let nodeI = graph.addNode("i")

graph.addSide(nodeA, neighbor: nodeB)
graph.addSide(nodeA, neighbor: nodeH)
graph.addSide(nodeB, neighbor: nodeA)
graph.addSide(nodeB, neighbor: nodeC)
graph.addSide(nodeB, neighbor: nodeH)
graph.addSide(nodeC, neighbor: nodeB)
graph.addSide(nodeC, neighbor: nodeD)
graph.addSide(nodeC, neighbor: nodeF)
graph.addSide(nodeC, neighbor: nodeI)
graph.addSide(nodeD, neighbor: nodeC)
graph.addSide(nodeD, neighbor: nodeE)
graph.addSide(nodeD, neighbor: nodeF)
graph.addSide(nodeE, neighbor: nodeD)
graph.addSide(nodeE, neighbor: nodeF)
graph.addSide(nodeF, neighbor: nodeC)
graph.addSide(nodeF, neighbor: nodeD)
graph.addSide(nodeF, neighbor: nodeE)
graph.addSide(nodeF, neighbor: nodeG)
graph.addSide(nodeG, neighbor: nodeF)
graph.addSide(nodeG, neighbor: nodeH)
graph.addSide(nodeG, neighbor: nodeI)
graph.addSide(nodeH, neighbor: nodeA)
graph.addSide(nodeH, neighbor: nodeB)
graph.addSide(nodeH, neighbor: nodeG)
graph.addSide(nodeH, neighbor: nodeI)
graph.addSide(nodeI, neighbor: nodeC)
graph.addSide(nodeI, neighbor: nodeG)
graph.addSide(nodeI, neighbor: nodeH)





let minimumTree = SearchMinimumTree(graph: graph, source: nodeA) // минимальное дерево
let depthSearch = depthFirstSearch(graph, source: nodeA) // обхода графа в глубину
let brSearch = breadthSearch(graph, source: nodeA) // обхода графа в ширину
let shPath = shortestPath(graph: graph, source: nodeH) // кротчайший путь
//print(minimumTree)
//print(depthSearch)
//print(shPath.nodes)
print(brSearch) // работает некорректно, где-то логичесткая ошибка...
