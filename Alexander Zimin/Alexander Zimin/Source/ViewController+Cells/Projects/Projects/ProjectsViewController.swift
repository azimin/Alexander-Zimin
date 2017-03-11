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
    var savedColor: UIColor = appColor.contentColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        savedColor = appColor.contentColor
        appColor.resetColor()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appColor.updateColor(savedColor)
    }
}

// MARK: - Constants

extension ProjectsViewController {
    fileprivate struct Constants {
        static let projectCellIdentifier = "ProjectCell"
        static let projectSegueIdentifier = "ShowProject"
    }
}

// MARK: - UITableViewDataSource

extension ProjectsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.projectCellIdentifier, for: indexPath) as! ProjectTableViewCell
        
        let project = projects[indexPath.section]
        
        cell.roundedType = .allRounded
        
        cell.isMacOS = project.isMacOs
        cell.appNameLabel.text = project.name
        cell.appIconImageView.image = UIImage(named: project.imageName)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clear }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowProject", sender: projects[indexPath.section])
    }
}

// MARK: - Segue

extension ProjectsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.projectSegueIdentifier {
            let controller = segue.destination as! ProjectViewController
            controller.project = sender as! Project
        }
    }
}
