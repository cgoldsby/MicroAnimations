//
//  ViewController.swift
//  MicroAnimations
//
//  Created by Christopher Goldsby on 10/5/17.
//  Copyright © 2017 Christopher Goldsby. All rights reserved.
//

import UIKit

final class FadeViewController: UIViewController {
    
    @IBOutlet private var emojiStackView: UIStackView!
    @IBOutlet private var emojiLabel1: UILabel!
    @IBOutlet private var emojiLabel2: UILabel!
    @IBOutlet private var emojiLabel3: UILabel!
    @IBOutlet private var emojiTextLabel1: UILabel!
    @IBOutlet private var emojiTextLabel2: UILabel!
    @IBOutlet private var emojiTextLabel3: UILabel!
    
    private lazy var emojiLabels = [emojiLabel1!, emojiLabel2!, emojiLabel3!]
    private lazy var emojiTextLabels = [emojiTextLabel1!, emojiTextLabel2!, emojiTextLabel3!]

    private var emojiIterator = LoopIterator(
        collection: [
            ("🐴", "equus"), ("🦄", "unicornis")
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        emojiStackView.axis = previousTraitCollection?.verticalSizeClass == .regular ? .horizontal : .vertical
    }
    
    // MARK: - Private
    
    private func setUpView() {
        let emoji = emojiIterator.next()
        zip(emojiLabels, emojiTextLabels).forEach {
            $0.0.clipsToBounds = true
            $0.0.layer.cornerRadius = $0.0.bounds.width / 2
            $0.0.layer.borderColor = UIColor.lightGray.cgColor
            $0.0.layer.borderWidth = 1
            $0.0.text = emoji?.0
            $0.1.text = emoji?.1
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func fadInAction(_ sender: Any) {
        let emoji = emojiIterator.next()
        let labels = zip(emojiLabels, emojiTextLabels).flatMap { $0 }
        
        labels[0].0.text = emoji?.0
        labels[0].1.text = emoji?.1

        labels[1].0.fade(in: emoji?.0)
        labels[1].1.fade(in: emoji?.1)
        
        labels[2].0.fade(in: emoji?.0, duration: 0.5)
        labels[2].1.fade(in: emoji?.1, duration: 0.5)
    }
}

// MARK: - Iterator

private struct LoopIterator<Base: Collection>: IteratorProtocol {
    
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
