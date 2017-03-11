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
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseNavigationController.setup), name: NSNotification.Name(rawValue: Constants.kAZNotificationColorChanged), object: nil)
        
        setup()
    }

    func setup() {
        let textAttributes = [NSForegroundColorAttributeName: UIColor.backgroundElementsColor,
            NSFontAttributeName: UIFont.appMediumFont()]
        self.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationBar.setBackgroundImage(UIImage.imageFromColor(UIColor.backgroundColor), for: UIBarMetrics.default)
        self.navigationBar.tintColor = appColor.contentColor
        
        self.navigationBar.isTranslucent = false
    }

}
