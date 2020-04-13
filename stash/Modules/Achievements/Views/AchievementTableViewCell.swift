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
    var bgImageView = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //bgImageView.frame = self.frame
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.cornerRadius = 20
        bgImageView.clipsToBounds = true
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bgImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
    }
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(achievement:Achievement?) {
        
        guard let achievement = achievement else {
            return
        }
        let url = URL(string: achievement.bg_image_url)
        bgImageView.kf.setImage(with: url)
        bgImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        bgImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        bgImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }

}
