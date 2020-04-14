//
//  AchievementsRouterTest.swift
//  stashTests
//
//  Created by Jonathan Green on 4/14/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import XCTest
@testable import stash
class AchievementsRouterTest: XCTestCase {
    
    var navigationController:UINavigationController!
    
    override func setUp() {
        super.setUp()
        navigationController = AchievementsRouter.createModule()
    }
    
    func testTopVCIsAchievementsVCWhenPresented() {
        XCTAssertTrue(navigationController.topViewController is AchievementsViewController)
    }

}
