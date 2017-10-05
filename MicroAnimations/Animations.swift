//
//  Animations.swift
//  MicroAnimations
//
//  Created by Christopher Goldsby on 10/5/17.
//  Copyright © 2017 Christopher Goldsby. All rights reserved.
//

import UIKit


extension CATransition {
    
    static func fade(_ duration: Double = 0.125) -> CATransition {
        let fadeTransition = CATransition()
        fadeTransition.duration = duration
        fadeTransition.type = kCATransitionFade
        fadeTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return fadeTransition
    }
    
    static func push(_ duration: Double = 5.3) -> CATransition {
        let moveInTransition = CATransition()
        moveInTransition.duration = duration
        moveInTransition.type = kCATransitionPush
        moveInTransition.subtype = kCATransitionFromTop
        moveInTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return moveInTransition
    }
    
    static func moveIn(_ duration: Double = 5.3) -> CATransition {
        let moveInTransition = CATransition()
        moveInTransition.duration = duration
        moveInTransition.type = kCATransitionMoveIn
        moveInTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return moveInTransition
    }
}

extension UILabel {
    
    func fade(in text: String?) {
        let animation = CATransition.fade(0.5)
        layer.add(animation, forKey: "changeTextAnimation")
        self.text = text
    }
    
    func moveIn(in text: String?) {
        let animation = CATransition.moveIn()
        layer.add(animation, forKey: "changeTextAnimation")
        self.text = text
    }
    
    func push(in text: String?) {
        let animation = CATransition.push()
        layer.add(animation, forKey: "changeTextAnimation")
        self.text = text
    }
}
