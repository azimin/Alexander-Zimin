//
//  BaseViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
