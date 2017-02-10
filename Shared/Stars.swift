//
//  Stars.swift
//  Planetarium Clock
//
//  Created by Thomas Leese on 10/02/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import SpriteKit

class StarNode: SKShapeNode {

    override init() {
        super.init()

        let x = -500 + Int(arc4random_uniform(1000))
        let y = -500 + Int(arc4random_uniform(1000))
        let diameter = Double(arc4random_uniform(100) + 10) / 50.0

        let origin = CGPoint(x: x, y: y)
        let size = CGSize(width: diameter, height: diameter)
        self.path = CGPath(ellipseIn: CGRect(origin: origin, size: size),
                           transform: nil)
        self.lineWidth = 0
        self.fillColor = SKColor.white

        let gapAction = SKAction.wait(forDuration: 5, withRange: 8)
        let colourAction = changeColourAction()
        let sequence = SKAction.sequence([colourAction, gapAction])
        run(SKAction.repeatForever(sequence))
    }

    private func changeColourAction() -> SKAction {
        return SKAction.customAction(withDuration: 0, actionBlock: { (node, time) -> Void in
            self.changeColour()
        })
    }

    private func changeColour() {
        let alpha = CGFloat(Double(arc4random_uniform(60)) / 100.0 + 0.1)
        self.fillColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: alpha)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class StarfieldNode: SKNode {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        createStars()
    }

    private func createStars() {
        for _ in 1...600 {
            addChild(StarNode())
        }

    }
    
}
