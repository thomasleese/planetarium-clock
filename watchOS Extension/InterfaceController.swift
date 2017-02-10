//
//  InterfaceController.swift
//  watchOS Extension
//
//  Created by Thomas Leese on 10/02/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var skInterface: WKInterfaceSKScene!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let scene = PlanetariumClockScene.loadScene()
        
        // Present the scene
        self.skInterface.presentScene(scene)
        
        // Use a preferredFramesPerSecond that will maintain consistent frame rate
        self.skInterface.preferredFramesPerSecond = 30
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
