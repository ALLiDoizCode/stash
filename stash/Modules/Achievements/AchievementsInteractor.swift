//
//  AchievementsInteractor.swift
//  stash
//
//  Created by Jonathan Green on 4/12/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation

class AchievementsInteractor: PresenterToInteractorAchievementsProtocol {
    let achievementsBusiness = AchievementsBusiness()
    
    // MARK: Properties
    var presenter: InteractorToPresenterAchievementsProtocol?
    
    func loadAchievements() {
        achievementsBusiness.achievements(parameters: [:]) { (achievements, error) in
            guard let achievements = achievements else {
                self.presenter?.fetchAchievementsFailure(error: error?.localizedDescription ?? "")
                return
            }
            
            self.presenter?.fetchAchievementsSuccess(achievements: achievements)
        }
    }
}
