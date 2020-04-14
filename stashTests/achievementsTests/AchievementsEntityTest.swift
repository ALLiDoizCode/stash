//
//  AchievementsEntityTest.swift
//  stashTests
//
//  Created by Jonathan Green on 4/14/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import XCTest
@testable import stash

class AchievementsEntityTest: XCTestCase {

    func testExample() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "achievements", ofType: "json") else {
            return
        }
        let decoder = JSONDecoder()
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let achievements = try! decoder.decode(Achievements.self, from: jsonData)
        XCTAssertEqual(achievements.success, true)
        XCTAssertEqual(achievements.status, 200)
        XCTAssertEqual(achievements.overview.title, "Smart Investing")
        XCTAssertEqual(achievements.achievements[0].id, 4)
        XCTAssertEqual(achievements.achievements[0].level, "1")
        XCTAssertEqual(achievements.achievements[0].progress, 10)
        XCTAssertEqual(achievements.achievements[0].total, 50)
        XCTAssertEqual(achievements.achievements[0].bg_image_url, "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png")
        XCTAssertEqual(achievements.achievements[0].accessible,true)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
