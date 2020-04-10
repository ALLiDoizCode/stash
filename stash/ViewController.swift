//
//  ViewController.swift
//  stash
//
//  Created by Jonathan Green on 4/8/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var achievementsBusiness = AchievementsBusiness()
    override func viewDidLoad() {
        super.viewDidLoad()
        achievementsBusiness.achievements(parameters: [:]) { (achievements, error) in
            //print(achievements?.achievements)
        }
        // Do any additional setup after loading the view.
    }


}

