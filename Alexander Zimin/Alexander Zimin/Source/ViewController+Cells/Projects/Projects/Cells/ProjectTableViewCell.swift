//
//  ProjectTableViewCell.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ProjectTableViewCell: RoundedTableViewCell {

    @IBOutlet weak var appIconImageView: UIImageView! {
        didSet {
            appIconImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var appNameLabel: UILabel! {
        didSet {
            appNameLabel.font = UIFont.appMediumFont()
            appNameLabel.textColor = UIColor.contentElementsColor
        }
    }
    
    var isMacOS: Bool = false {
        didSet {
            if isMacOS {
                appIconImageView.layer.cornerRadius = 0
            } else {
                appIconImageView.layer.cornerRadius = 14.5
            }
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
