//
//  AnglesTests.swift
//  Planetarium Clock
//
//  Created by Thomas Leese on 05/05/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import XCTest

class AnglesTests: XCTestCase {

    func testDegreesToRadians() {
        XCTAssert(0.degreesToRadians == 0)
        XCTAssert(180.degreesToRadians == M_PI)
        XCTAssert(360.degreesToRadians == 2 * M_PI)
    }

    func testRadiansToDegrees() {
        XCTAssert(0.radiansToDegrees == 0)
        XCTAssert(M_PI.radiansToDegrees == 180)
        XCTAssert((M_PI * 2).radiansToDegrees == 360)
    }

}
