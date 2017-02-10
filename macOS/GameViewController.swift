//
//  GameViewController.swift
//  macOS
//
//  Created by Thomas Leese on 10/02/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class GameViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = PlanetariumClockScene.loadScene()
        
        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        
        skView.showsFPS = true
        skView.showsNodeCount = true
    }

}

