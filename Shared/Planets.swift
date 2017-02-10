//
//  Planets.swift
//  Planetarium Clock
//
//  Created by Thomas Leese on 10/02/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import SpriteKit

class PlanetNode: SKNode {

    let orbit: Int
    let diameter: Int

    let ball: SKSpriteNode
    let shadow: SKSpriteNode
    let background: SKSpriteNode

    var radius: Int { return Orbit.radius(for: orbit) }

    init(_ orbit: Int, _ colour: SKColor, _ diameter: Int) {
        self.orbit = orbit
        self.diameter = diameter

        background = SKSpriteNode(imageNamed: "Background")
        shadow = SKSpriteNode(imageNamed: "Shadow")
        ball = SKSpriteNode(imageNamed: "Ball")

        super.init()

        addChild(shadow)
        addChild(background)
        addChild(ball)

        shadow.colorBlendFactor = 1.0
        shadow.color = colour

        background.blendMode = .add
        background.colorBlendFactor = 1.0
        background.color = colour.withAlphaComponent(0.75)

        ball.blendMode = .alpha

        xScale = 0.2
        yScale = 0.2

        setPosition(angle: Float(orbit) * 5.0)
    }

    public func scaleDiameter(min: Float, max: Float, smallest: Float, largest: Float) {
        let scaledDiameter = ((max - min) / (largest - smallest)) * (Float(diameter) - smallest) + min;
        xScale = CGFloat(scaledDiameter)
        yScale = CGFloat(scaledDiameter)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setPosition(angle: Float) {
        let radius = Float(self.radius)
        position = CGPoint(x: CGFloat(cos(angle) * radius),
                           y: CGFloat(sin(angle) * radius))
        zRotation = CGFloat(angle - Float.pi / 2.0)

    }

}

class PlanetsLayerNode: SKNode {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        createPlanets()
    }

    private func createPlanets() {
        addChild(PlanetNode(1, SKColor(hex: 0x808080), 4780))
        addChild(PlanetNode(2, SKColor(hex: 0xff9000), 12104))
        addChild(PlanetNode(3, SKColor(hex: 0x00c050), 12756))
        addChild(PlanetNode(4, SKColor(hex: 0xef1000), 6780))
        addChild(PlanetNode(5, SKColor(hex: 0xe0a070), 139822))
        addChild(PlanetNode(6, SKColor(hex: 0xefb020), 116464))
        addChild(PlanetNode(7, SKColor(hex: 0x00b0c0), 50724))
        addChild(PlanetNode(8, SKColor(hex: 0x1540ff), 49248))

        let max = 139822.0 as Float
        let min = 4780.0 as Float

        for node in children {
            if let planet = node as? PlanetNode {
                planet.scaleDiameter(min: 0.12, max: 0.2,
                                     smallest: min, largest: max)
            }
        }
    }

}
