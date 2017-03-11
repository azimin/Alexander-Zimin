//
//  MenuItemCollectionViewCell.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    var fillColor: UIColor = UIColor.lightGray
    
    @IBOutlet weak var categoryNameLabel: UILabel! {
        didSet {
            categoryNameLabel.font = UIFont.appDemiBoldFont()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = Apperance.defaultCornerRadius
        self.contentView.layer.borderWidth = 1.0
        
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.layer.cornerRadius = Apperance.defaultCornerRadius
        self.selectedBackgroundView?.layer.masksToBounds = true
    }
    
    func fillWithColor(_ color: UIColor) {
        fillColor = color
        categoryNameLabel.textColor = color
        iconImage.image = iconImage.image?.imageWithColor(color)
        
        self.contentView.layer.borderColor = color.cgColor
        self.selectedBackgroundView?.backgroundColor = color.withAlphaComponent(0.6)
    }
}
