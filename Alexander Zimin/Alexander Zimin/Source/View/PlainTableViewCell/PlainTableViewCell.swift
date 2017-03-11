//
//  PlainTableViewCell.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class PlainTableViewCell: RoundedTableViewCell {

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont.appMediumFont()
            nameLabel.textColor = UIColor.contentElementsColor
        }
    }
    
    @IBOutlet weak var accessorizeImageView: UIImageView! {
        didSet {
            accessorizeImageView.image = accessorizeImageView.image?.imageWithColor(appColor.contentColor)
        }
    }
    
    @IBOutlet weak var accessorizeWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var accessorizeRightConstraint: NSLayoutConstraint!
    
    override func prepareForReuse() {
        nameLabel.textColor = UIColor.contentElementsColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setOpened(false, animated: false)
    }
    
    var selectionEnable: Bool = false {
        didSet {
            isUserInteractionEnabled = selectionEnable
            accessorizeImageView.isHidden = !selectionEnable
            
            if selectionEnable {
                accessorizeRightConstraint.constant = 16
                accessorizeWidthConstraint.constant = 11
                nameLabel.font = UIFont.appMediumFont()
            } else {
                accessorizeRightConstraint.constant = 0
                accessorizeWidthConstraint.constant = 0
                nameLabel.font = UIFont.appRegularFont()
            }
        }
    }
    
    fileprivate(set) var opened: Bool = false
    
    func setOpened(_ opened: Bool, animated: Bool) {
        setOpened(opened, animated: animated, complition: nil)
    }
    
    func setOpened(_ opened: Bool, animated: Bool, complition: (()->())?) {
        self.opened = opened
        let duration = animated ? 0.25 : 0.0
        
        UIView.animate(withDuration: duration, animations: { () -> Void in
            self.rotateAction(opened)
        }, completion: { (success) -> Void in
            complition?()
        }) 
    }
    
    fileprivate func rotateAction(_ opened: Bool) {
        if opened {
            accessorizeImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2));
        } else {
            accessorizeImageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2));
        }
    }
    
}
