//
//  ProjectsViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class ProjectsViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    var projects: [Project] = ProjectsParser.projects
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
    }
    
}


// MARK: - Constants

extension ProjectsViewController {
    private struct Constants {
        static let projectCellIdentifier = "ProjectCell"
        static let projectSegueIdentifier = "ShowProject"
    }
}

// MARK: - UITableViewDataSource

extension ProjectsViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return projects.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.projectCellIdentifier, forIndexPath: indexPath) as! ProjectTableViewCell
        
        var project = projects[indexPath.section]
        
        cell.roundedType = .AllRounded
        
        cell.isMacOS = project.isMacOs
        cell.appNameLabel.text = project.name
        cell.appIconImageView.image = UIImage(named: project.imageName)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProjectsViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clearColor() }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("ShowProject", sender: projects[indexPath.section])
    }
}

// MARK: - Segue

extension ProjectsViewController {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.projectSegueIdentifier {
            let controller = segue.destinationViewController as! ProjectViewController
            controller.project = sender as! Project
        }
    }
}