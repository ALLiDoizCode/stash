//
//  AchievementsBusiness.swift
//  stash
//
//  Created by Jonathan Green on 4/8/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation

class AchievementsBusiness {
    
    private lazy var achievementsServices = AchievementServices()
    
    // MARK: -
    
    func achievements(parameters: [String: Any],
               completion:@escaping ((_ Achievements: Achievements?, _ error: Error?) -> ()) ) {
        
        achievementsServices.getAchievements(parameters: parameters) { (response, error) in
            completion(response, error)
        }
    }
    
}
