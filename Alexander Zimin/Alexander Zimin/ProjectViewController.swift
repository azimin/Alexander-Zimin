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
    var info: [ProjectInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        
        info = project.additionalInfo
        info.insert(ProjectInfo(name: "Platform", description: project.isMacOs ? "OS X" : "iOS"), atIndex: 0)
        info.insert(ProjectInfo(name: "Name", description: project.name), atIndex: 0)
    }

}

// MARK: - Constants

extension ProjectViewController {
    private struct Constants {
        static let projectInfoCellIdentifier = "ProjectInfoCell"
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
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.projectInfoCellIdentifier, forIndexPath: indexPath) as! ProjectInfoTableViewCell
        
        if indexPath.row == 0 {
            cell.roundedType = .TopRounded
        } else if indexPath.row == info.count - 1 {
            cell.roundedType = .BottomRounded
        } else {
            cell.roundedType = .None
        }
        
        cell.nameLabel.text = info[indexPath.row].name
        cell.infoDescription = info[indexPath.row].description
        cell.selectionEnable = info[indexPath.row].isURL
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProjectViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clearColor() }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let url = NSURL(string: info[indexPath.row].description)
        if let url = url {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}
