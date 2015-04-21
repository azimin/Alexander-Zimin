//
//  MainViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 21/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
   
    @IBOutlet weak var tableView: UITableView!
    var items = ["Working projects", "Education", "Technical Skills", "Interests"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("WorkingProjects", sender: nil)
    }
}

