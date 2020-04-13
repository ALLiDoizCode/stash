//
//  AchievementsPresenter.swift
//  stash
//
//  Created by Jonathan Green on 4/12/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation

class AchievementsPresenter: ViewToPresenterAchievementsProtocol {

    // MARK: Properties
    var view: PresenterToViewAchievementsProtocol?
    var interactor: PresenterToInteractorAchievementsProtocol?
    var router: PresenterToRouterAchievementsProtocol?
    
    func refresh() {
        interactor?.loadAchievements()
    }
}

extension AchievementsPresenter: InteractorToPresenterAchievementsProtocol {
    func fetchAchievementsSuccess(achievements:Achievements) {
        DispatchQueue.main.async {
            self.view?.onFetchAchievementsSuccess(achievements: achievements)
        }
    }
    
    func fetchAchievementsFailure(error:String) {
        view?.onFetchAchievementsFailure(error: error)
    }
        
}
