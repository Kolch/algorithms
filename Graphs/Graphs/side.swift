//
//  side.swift
//  Graphs
//
//  Created by kolch_a on 05/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//

// Класс ребра
public class Side: Equatable {
    public var neighbor: Node // связанный узел
    
    public init(_ neighbor: Node) {
        self.neighbor = neighbor
    }
}

public func == (_ lhs: Side, rhs: Side) -> Bool {
    return lhs.neighbor == rhs.neighbor
}
