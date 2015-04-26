//
//  PlainTableViewCell.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ImageTableViewCell: RoundedTableViewCell {

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont.appMediumFont()
            nameLabel.textColor = UIColor.contentElementsColor
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userInteractionEnabled = false
    }
}
