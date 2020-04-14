//
//  AchievementsPresenterTest.swift
//  stashTests
//
//  Created by Jonathan Green on 4/14/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import XCTest
@testable import stash

class AchievementsPresenterTest: XCTestCase {
    
    class AchievementsInteractorSpy:AchievementsInteractor {
        var didMessagIneractor:Bool!
        override func loadAchievements() {
            didMessagIneractor = true
        }
    }
    
    class AchievementsViewControllerSpy:AchievementsViewController {
        var error:String?
        override func onFetchAchievementsFailure(error: String) {
            self.error = error
        }
    }
    
    let achievementsInteractor = AchievementsInteractorSpy()
    let achievementsViewController = AchievementsViewControllerSpy()
    var presenter:AchievementsPresenter?
    override func setUp() {
        super.setUp()
        presenter = AchievementsPresenter()
        presenter?.interactor = achievementsInteractor
        presenter?.view = achievementsViewController
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOnFetchAchievementsSuccess() {
        guard let path = Bundle(for: type(of: self)).path(forResource: "achievements", ofType: "json") else {
            return
        }
        let decoder = JSONDecoder()
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let achievements = try! decoder.decode(Achievements.self, from: jsonData)
        presenter?.fetchAchievementsSuccess(achievements: achievements)
        XCTAssertEqual(achievementsViewController.achievements?._id,achievements._id)
    }
    
    func testOnFetchAchievementsFailure() {
        presenter?.fetchAchievementsFailure(error: "test error")
        XCTAssertEqual(achievementsViewController.error,"test error")
    }
    
    func testLoadAchievements() {
        presenter?.refresh()
        XCTAssertEqual(achievementsInteractor.didMessagIneractor,true)
    }

}
