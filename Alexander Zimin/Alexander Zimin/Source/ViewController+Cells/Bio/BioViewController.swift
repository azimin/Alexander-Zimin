//
//  BioViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class BioViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    var items: [InfoItem] = BioParser.bioItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 128
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
        tableView.registerNib(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
    }

}
// MARK: - UITableViewDataSource

extension BioViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return items.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return tableView.dequeueReusableCellWithIdentifier("AvaCell", forIndexPath: indexPath) as! UITableViewCell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.infoTableViewCellIdentifier, forIndexPath: indexPath) as! InfoTableViewCell
        
        let item = items[indexPath.row]
        
        if indexPath.row == 0 {
            cell.roundedType = .TopRounded
        } else if indexPath.row == items.count - 1 {
            cell.roundedType = .BottomRounded
        } else {
            cell.roundedType = .None
        }
        
        cell.nameLabel.text = item.name
        cell.infoDescription = item.description
        cell.selectionEnable = item.isURL
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension BioViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let url = NSURL(string: items[indexPath.row].description)
        if let url = url {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}