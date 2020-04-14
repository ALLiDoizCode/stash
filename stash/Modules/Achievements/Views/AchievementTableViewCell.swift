//
//  AchievementTableViewCell.swift
//  stash
//
//  Created by Jonathan Green on 4/13/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import UIKit
import Kingfisher

class AchievementTableViewCell: UITableViewCell {
    var transparentView = UIView()
    var bgImageView = UIImageView()
    var progressBar = UIProgressView()
    var levelView = UIView()
    var levelTitle = UILabel()
    var levelSubtitle = UILabel()
    var currentPoints = UILabel()
    var maxPoints = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(bgImageView)
        self.addSubview(progressBar)
        self.addSubview(currentPoints)
        self.addSubview(maxPoints)
        self.addSubview(levelView)
        self.levelView.addSubview(levelTitle)
        self.levelView.addSubview(levelSubtitle)
        self.addSubview(transparentView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        levelView.layer.cornerRadius = levelView.frame.width/2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func buildImageView(urlString:String)  {
        let url = URL(string: urlString)
        bgImageView.kf.setImage(with: url)
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.cornerRadius = 20
        bgImageView.clipsToBounds = true
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        bgImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        bgImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
    
    func buildProgressBar(progress:Int,points:Int) {
        let progressValue = Float(progress)/100
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.0, y: 6.0)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.clipsToBounds = true
        progressBar.progress = progressValue
        progressBar.backgroundColor = .white
        progressBar.progressTintColor = .green
        progressBar.layer.cornerRadius = 5
        progressBar.transform = transform;
        progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        progressBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.83).isActive = true
        progressBar.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -80).isActive = true
        
        currentPoints.translatesAutoresizingMaskIntoConstraints = false
        currentPoints.text = "\(progress)pts"
        currentPoints.font = UIFont(name: "HelveticaNeue-Bold", size: 21)
        currentPoints.textColor = .white
        currentPoints.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20).isActive = true
        currentPoints.leftAnchor.constraint(equalTo: progressBar.leftAnchor, constant: 0).isActive = true
        
        maxPoints.translatesAutoresizingMaskIntoConstraints = false
        maxPoints.text = "\(points)pts"
        maxPoints.textAlignment = .right
        maxPoints.font = UIFont(name: "HelveticaNeue-Bold", size: 21)
        maxPoints.textColor = .white
        maxPoints.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20).isActive = true
        maxPoints.rightAnchor.constraint(equalTo: progressBar.rightAnchor, constant: 0).isActive = true
    }
    
    func buildLevelView(level:String) {
        levelView.translatesAutoresizingMaskIntoConstraints = false
        levelView.backgroundColor = .white
        levelView.alpha = 0.9
        levelView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        levelView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        levelView.heightAnchor.constraint(equalTo: levelView.widthAnchor, multiplier: 1).isActive = true
        levelView.bottomAnchor.constraint(equalTo: progressBar.topAnchor, constant: -20).isActive = true
        levelView.layer.masksToBounds = true
        
        levelTitle.text = "Level"
        levelTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        levelTitle.textColor = .darkGray
        levelTitle.textAlignment = .center
        levelTitle.translatesAutoresizingMaskIntoConstraints = false
        levelTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        levelTitle.widthAnchor.constraint(equalTo: levelView.widthAnchor, multiplier: 0.42).isActive = true
        levelTitle.topAnchor.constraint(equalTo: levelView.topAnchor, constant: 30).isActive = true
        
        levelSubtitle.text = level
        levelSubtitle.font = UIFont(name: "HelveticaNeue-Bold", size: 60)
        levelSubtitle.textAlignment = .center
        levelSubtitle.translatesAutoresizingMaskIntoConstraints = false
        levelSubtitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        levelSubtitle.widthAnchor.constraint(equalTo: levelView.widthAnchor, multiplier: 0.42).isActive = true
        levelSubtitle.topAnchor.constraint(equalTo: levelTitle.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupCell(achievement:Achievement?) {
        transparentView.backgroundColor = .white
        transparentView.alpha = 0;
        transparentView.layer.cornerRadius = 20
        transparentView.clipsToBounds = true
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        transparentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        transparentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        transparentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        if achievement?.accessible == false {
            transparentView.alpha = 0.7;
        }
        
        guard let achievement = achievement else {
            return
        }
        
        buildImageView(urlString:achievement.bg_image_url)
        buildProgressBar(progress:achievement.progress, points: achievement.total)
        buildLevelView(level:achievement.level)
    }

}
