//
//  AchievementsViewController.swift
//  stash
//
//  Created by Jonathan Green on 4/12/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterAchievementsProtocol?
    var achievements:Achievements?
    var tableView:UITableView?
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.refresh()
    }

}

extension AchievementsViewController: PresenterToViewAchievementsProtocol{
    
    func onFetchAchievementsSuccess(achievements:Achievements) {
        //make sur eot push to main thread
        self.achievements = achievements
        print(achievements.achievements)
        //tableView?.reloadData()
        
    }
    
    func onFetchAchievementsFailure(error: String) {
        
    }
}
