//
//  ClockLayer.swift
//  Planetarium Clock
//
//  Created by Thomas Leese on 10/02/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import SpriteKit

class HandNode: SKShapeNode {

    let component: Calendar.Component

    init(_ component: Calendar.Component, orbit: Int) {
        self.component = component

        super.init()

        let radius = Orbit.radius(for: orbit)

        let origin = CGPoint(x: -2, y: -2)
        let size = CGSize(width: 2, height: radius + 2)
        self.path = CGPath(rect: CGRect(origin: origin, size: size),
                           transform: nil)
        self.lineWidth = 0
        self.fillColor = SKColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(date: Date) {
        let calendar = NSCalendar.current

        var proportion = 0.0

        if component == .hour {
            proportion = Double(calendar.component(.hour, from: date) * 60 +
                calendar.component(.minute, from: date)) / 720.0
        } else if component == .minute {
            proportion = Double(calendar.component(.minute, from: date) * 60 +
                calendar.component(.second, from: date)) / 3600.0
        } else if component == .second {
            proportion = Double(calendar.component(.second, from: date) * 1000 +
                calendar.component(.nanosecond, from: date) / 1_000_000) / 60000.0
        } else {
            fatalError("Unsupported time component.")
        }

        self.zRotation = CGFloat(proportion * -2 * Double.pi)
    }

}

class ClockLayerNode: SKNode {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        createNodes()
    }

    private func createNodes() {
        addChild(HandNode(.hour, orbit: 4))
        addChild(HandNode(.minute, orbit: 6))
        addChild(HandNode(.second, orbit: 8))
    }

    func updateHands() {
        let date = Date()

        for child in children {
            if let hand = child as? HandNode {
                hand.update(date: date)
            }
        }
    }
    
}
