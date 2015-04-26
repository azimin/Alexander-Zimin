//
//  BaseNavigationController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        var textAttributes = [NSForegroundColorAttributeName: UIColor.backgroundElementsColor,
            NSFontAttributeName: UIFont.appMediumFont()]
        self.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationBar.setBackgroundImage(UIImage.imageFromColor(UIColor.backgroundColor), forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.tintColor = UIColor.backgroundElementsColor.colorWithAlphaComponent(0.6)
        
        self.navigationBar.translucent = false
    }

}
