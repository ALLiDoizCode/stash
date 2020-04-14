//
//  AchievementsRouter.swift
//  stash
//
//  Created by Jonathan Green on 4/12/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation
import UIKit

class AchievementsRouter: PresenterToRouterAchievementsProtocol {
   
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        let viewController = AchievementsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.barTintColor = UIColor(red:0.41, green:0.21, blue:0.81, alpha:1.00)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        let presenter: ViewToPresenterAchievementsProtocol & InteractorToPresenterAchievementsProtocol = AchievementsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AchievementsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AchievementsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
}
