//
//  BaseViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class InterestsViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    var interests: [Interest] = InterestsParser.interests
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
        
        tableView.registerNib(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
        tableView.registerNib(UINib(nibName: Constants.imageTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.imageTableViewCellIdentifier)
    }

}

// MARK: - UITableViewDataSource

extension InterestsViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return interests.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.imageTableViewCellIdentifier, forIndexPath: indexPath) as! ImageTableViewCell
            
            cell.roundedType = .TopRounded
            cell.nameLabel.text = interests[indexPath.row].name
            cell.iconImageView.image = UIImage(named: interests[indexPath.row].imageName)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.infoTableViewCellIdentifier, forIndexPath: indexPath) as! InfoTableViewCell
            
            cell.roundedType = .BottomRounded
            cell.nameLabel.text = "How I feel about"
            cell.infoDescription = interests[indexPath.row].description
            cell.selectionEnable = false
            
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension InterestsViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clearColor() }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
}