//
//  LoopIterator.swift
//  MicroAnimations
//
//  Created by Christopher Goldsby on 10/6/17.
//  Copyright © 2017 Christopher Goldsby. All rights reserved.
//

import Foundation

struct LoopIterator<Base: Collection>: IteratorProtocol {
    
    private let collection: Base
    private var index: Base.Index
    
    public init(collection: Base) {
        self.collection = collection
        index = collection.startIndex
    }
    
    public mutating func next() -> Base.Iterator.Element? {
        guard !collection.isEmpty else { return nil }
        
        defer {
            collection.formIndex(after: &index)
            if index == collection.endIndex {
                index = collection.startIndex
            }
        }
        
        return collection[index]
    }
}
