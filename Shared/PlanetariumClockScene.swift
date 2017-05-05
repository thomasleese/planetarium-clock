//
//  GameScene.swift
//  Planetarium Clock
//
//  Created by Thomas Leese on 10/02/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import SpriteKit
#if os(watchOS)
    import WatchKit
    // <rdar://problem/26756207> SKColor typealias does not seem to be exposed on watchOS SpriteKit
    typealias SKColor = UIColor
#endif

extension SKColor {

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }

}

class PlanetariumClockScene: SKScene {
    
    fileprivate var clock : ClockLayerNode?

    class func loadScene() -> PlanetariumClockScene {
        guard let scene = SKScene(fileNamed: "PlanetariumClockScene") as? PlanetariumClockScene else {
            fatalError("Failed to load scene!")
        }
        
        scene.scaleMode = .aspectFit

        return scene
    }
    
    func setUpScene() {
        self.clock = self.childNode(withName: "//clock") as? ClockLayerNode
    }
    
    #if os(watchOS)
    override func sceneDidLoad() {
        self.setUpScene()
    }
    #else
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    #endif

    override func update(_ currentTime: TimeInterval) {
        if let clock = self.clock {
            clock.updateHands()
        }
    }
}

#if os(iOS) || os(tvOS)
extension PlanetariumClockScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {

        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {

        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {

        }
    }
    
   
}
#endif

#if os(OSX)
extension PlanetariumClockScene {

    override func mouseDown(with event: NSEvent) {

    }
    
    override func mouseDragged(with event: NSEvent) {

    }
    
    override func mouseUp(with event: NSEvent) {

    }

}
#endif

