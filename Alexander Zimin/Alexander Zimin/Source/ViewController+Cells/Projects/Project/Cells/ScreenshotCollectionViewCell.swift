//
//  ScreenshotCollectionViewCell.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ScreenshotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var screenshotImageView: UIImageView! {
        didSet {
            screenshotImageView.layer.borderColor = UIColor.contentElementsColor.cgColor
            screenshotImageView.layer.cornerRadius = Apperance.defaultCornerRadius
            screenshotImageView.layer.masksToBounds = true
        }
    }
    
    var needToShowFrame: Bool = false {
        didSet {
            if needToShowFrame {
                screenshotImageView.layer.borderWidth = 1
                
            } else {
                screenshotImageView.layer.borderWidth = 0
            }
        }
    }
    
}
