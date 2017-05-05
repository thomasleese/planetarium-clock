//
//  Angles.swift
//  Planetarium Clock
//
//  Created by Thomas Leese on 05/05/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import Foundation

extension Int {

    var degreesToRadians: Double {
        return Double(self) * .pi / 180
    }

}

extension FloatingPoint {

    var degreesToRadians: Self {
        return self * .pi / 180
    }

    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
    
}
