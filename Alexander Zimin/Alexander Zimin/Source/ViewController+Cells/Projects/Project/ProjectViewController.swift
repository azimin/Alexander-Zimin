//
//  ProjectViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ProjectViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var project: Project!
    var info: [InfoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: Apperance.defaultSpace, left: 0, bottom: Apperance.defaultSpace, right: 0)
        tableView.registerNib(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
        
        info = project.additionalInfo
        info.insert(InfoItem(name: "Platform", description: project.isMacOs ? "OS X" : "iOS"), atIndex: 0)
        info.insert(InfoItem(name: "Name", description: project.name), atIndex: 0)
    }

}

// MARK: - UITableViewDataSource

extension ProjectViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.infoTableViewCellIdentifier, forIndexPath: indexPath) as! InfoTableViewCell
        
        if indexPath.row == 0 {
            cell.roundedType = .TopRounded
        } else if indexPath.row == info.count - 1 {
            cell.roundedType = .BottomRounded
        } else {
            cell.roundedType = .None
        }
        
        if info.count == 1 {
            cell.roundedType = .AllRounded
        }
        
        cell.nameLabel.text = info[indexPath.row].name
        cell.infoDescription = info[indexPath.row].description
        cell.selectionEnable = info[indexPath.row].isURL
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProjectViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let url = NSURL(string: info[indexPath.row].description)
        if let url = url {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}
