//
//  EducationViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class EducationViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    var items: [[InfoItem]] = EducationParser.education
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
        tableView.registerNib(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
    }

    func itemAtIndexPath(indexPath: NSIndexPath) -> InfoItem {
        return items[indexPath.section][indexPath.row]
    }
}


// MARK: - UITableViewDataSource

extension EducationViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.infoTableViewCellIdentifier, forIndexPath: indexPath) as! InfoTableViewCell
        
        let item = itemAtIndexPath(indexPath)
        
        if indexPath.row == 0 {
            cell.roundedType = .TopRounded
        } else if indexPath.row == items[indexPath.section].count - 1 {
            cell.roundedType = .BottomRounded
        } else {
            cell.roundedType = .None
        }
        
        if items[indexPath.section].count == 1 {
            cell.roundedType = .AllRounded
        }
        
        cell.nameLabel.text = item.name
        cell.infoDescription = item.description
        cell.selectionEnable = item.isURL
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension EducationViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clearColor() }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let url = NSURL(string: items[indexPath.section][indexPath.row].description)
        if let url = url {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}
