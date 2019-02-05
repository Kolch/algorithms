//
//  queue.swift
//  Graphs
//
//  Created by kolch_a on 04/02/2019.
//  Copyright © 2019 Kolchedantsev Alexey. All rights reserved.
//
// Класс очереди
public struct Queue<T> {
    private var array: [T]
    
    public init() {
        array = []
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func addToQueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func removeFromQueue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public func peek() -> T? {
        return array.first
    }
}
