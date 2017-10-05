//
//  ViewController.swift
//  MicroAnimations
//
//  Created by Christopher Goldsby on 10/5/17.
//  Copyright © 2017 Christopher Goldsby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var num = 0
    
    var animalTransitionIterator = LoopIterator(collection: ["🦄", "🐴"])
    
    @IBOutlet var label: UILabel!
    
    @IBAction func fadIn() {
//        num += 1
        label.fade(in: animalTransitionIterator.next())

//        label.fade(in: "\(num)")
//        label.push(in: "\(num)")

    }
}

public struct LoopIterator<Base: Collection>: IteratorProtocol {
    
    private let collection: Base
    private var index: Base.Index
    
    public init(collection: Base) {
        self.collection = collection
        self.index = collection.startIndex
    }
    
    public mutating func next() -> Base.Iterator.Element? {
        guard !collection.isEmpty else {
            return nil
        }
        
        let result = collection[index]
        collection.formIndex(after: &index) // (*) See discussion below
        if index == collection.endIndex {
            index = collection.startIndex
        }
        return result
    }
}
