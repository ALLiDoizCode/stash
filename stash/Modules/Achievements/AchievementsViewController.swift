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
        let infoButton = UIButton(type: .infoLight)
        infoButton.tintColor = .white
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: infoButton)
        self.navigationItem.rightBarButtonItem = barButton
        self.title = "Smart Investing"
        tableView = UITableView(frame: self.view.frame)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(AchievementTableViewCell.self, forCellReuseIdentifier: "achievements")
        self.view.addSubview(tableView ?? UITableView())
        presenter?.refresh()
    }
    
    @objc func infoButtonTapped() {
        
    }

}

extension AchievementsViewController: PresenterToViewAchievementsProtocol{
    
    func onFetchAchievementsSuccess(achievements:Achievements) {
        //make sur eot push to main thread
        self.achievements = achievements
        tableView?.reloadData()
    }
    
    @objc func onFetchAchievementsFailure(error: String) {
        
    }
}

extension AchievementsViewController :UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements?.achievements.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "achievements", for: indexPath) as? AchievementTableViewCell
        cell?.setupCell(achievement:achievements?.achievements[indexPath.row])
        return cell ?? AchievementTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 275
    }

}
