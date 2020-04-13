//
//  AchievementsContract.swift
//  stash
//
//  Created by Jonathan Green on 4/12/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAchievementsProtocol {
   func onFetchAchievementsSuccess(achievements:Achievements)
   func onFetchAchievementsFailure(error:String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAchievementsProtocol {
    
    var view: PresenterToViewAchievementsProtocol? { get set }
    var interactor: PresenterToInteractorAchievementsProtocol? { get set }
    var router: PresenterToRouterAchievementsProtocol? { get set }
    func refresh()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAchievementsProtocol {
    
    var presenter: InteractorToPresenterAchievementsProtocol? { get set }
    func loadAchievements()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAchievementsProtocol {
    func fetchAchievementsSuccess(achievements:Achievements)
    func fetchAchievementsFailure(error:String)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAchievementsProtocol {
    static func createModule() -> UINavigationController
}
