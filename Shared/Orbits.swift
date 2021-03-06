//
//  OrbitsNode.swift
//  Planetarium Clock
//
//  Created by Thomas Leese on 10/02/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import SpriteKit

class Orbit {

    class func radius(for orbit: Int) -> Int {
        return 60 + orbit * 45
    }

}

class OrbitNode: SKShapeNode {

    init(_ number: Int) {
        super.init()

        let radius = Orbit.radius(for: number)
        let diameter = radius * 2
        let origin = CGPoint(x: -radius, y: -radius)
        let size = CGSize(width: diameter, height: diameter)
        self.path = CGPath(ellipseIn: CGRect(origin: origin, size: size),
                           transform: nil)
        self.lineWidth = 0.25
        self.strokeColor = SKColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class MonthMarkerNode: SKShapeNode {

    class func totalDaysInYear() -> Int {
        let calendar = Calendar.current

        var totalDays = 0

        for i in 1...12 {
            let date = calendar.date(from: DateComponents(month: i))!
            let range = calendar.range(of: .day, in: .month, for: date)!
            totalDays += range.count
        }

        return totalDays
    }

    init(month: Int, orbit: Int) {
        super.init()

        let calendar = Calendar.current

        let daysInYear = MonthMarkerNode.totalDaysInYear()

        var totalDays = 0

        for i in 1...month {
            let date = calendar.date(from: DateComponents(month: i))!
            let range = calendar.range(of: .day, in: .month, for: date)!
            totalDays += range.count
        }

        let angle = (Float(totalDays) / Float(daysInYear)) * 360.0

        let radius = Orbit.radius(for: orbit)
        let origin = CGPoint(x: -2, y: radius)
        let size = CGSize(width: 2, height: 15)
        self.path = CGPath(rect: CGRect(origin: origin, size: size),
                           transform: nil)
        self.lineWidth = 0
        self.fillColor = SKColor.black
        self.zRotation = CGFloat(angle.degreesToRadians)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class OrbitsLayerNode: SKNode {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        createNodes()
    }

    private func createNodes() {
        for orbit in 1...8 {
            addChild(OrbitNode(orbit))
        }

        let earthOrbit = 3

        for month in 1...12 {
            addChild(MonthMarkerNode(month: month, orbit: earthOrbit))
        }
    }

}
