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
    
    @IBOutlet weak var accessorizeImageView: UIImageView!
    @IBOutlet weak var accessorizeWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var accessorizeRightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setOpened(false, animated: false)
    }
    
    var selectionEnable: Bool = false {
        didSet {
            userInteractionEnabled = selectionEnable
            accessorizeImageView.hidden = !selectionEnable
            
            if selectionEnable {
                accessorizeRightConstraint.constant = 8
                accessorizeWidthConstraint.constant = 11
            } else {
                accessorizeRightConstraint.constant = 0
                accessorizeWidthConstraint.constant = 0
            }
        }
    }
    
    private(set) var opened: Bool = false
    
    func setOpened(opened: Bool, animated: Bool) {
        self.opened = opened
        let duration = animated ? 0.25 : 0.0
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.rotateAction(opened)
        })
    }
    
    private func rotateAction(opened: Bool) {
        if opened {
            accessorizeImageView.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2));
        } else {
            accessorizeImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2));
        }
    }
    
}
