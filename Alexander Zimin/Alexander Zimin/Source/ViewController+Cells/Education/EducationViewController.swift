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
        tableView.register(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
    }

    func itemAtIndexPath(_ indexPath: IndexPath) -> InfoItem {
        return items[indexPath.section][indexPath.row]
    }
}


// MARK: - UITableViewDataSource

extension EducationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.infoTableViewCellIdentifier, for: indexPath) as! InfoTableViewCell
        
        let item = itemAtIndexPath(indexPath)
        
        if indexPath.row == 0 {
            cell.roundedType = .topRounded
        } else if indexPath.row == items[indexPath.section].count - 1 {
            cell.roundedType = .bottomRounded
        } else {
            cell.roundedType = .none
        }
        
        if items[indexPath.section].count == 1 {
            cell.roundedType = .allRounded
        }
        
        cell.nameLabel.text = item.name
        cell.infoDescription = item.description
        cell.selectionEnable = item.isURL
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension EducationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clear }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let url = URL(string: items[indexPath.section][indexPath.row].description)
        if let url = url {
            UIApplication.shared.openURL(url)
        }
    }
}
