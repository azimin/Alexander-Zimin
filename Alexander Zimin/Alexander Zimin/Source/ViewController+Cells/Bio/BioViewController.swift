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
        tableView.register(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
    }

}
// MARK: - UITableViewDataSource

extension BioViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "AvaCell", for: indexPath) 
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.infoTableViewCellIdentifier, for: indexPath) as! InfoTableViewCell
        
        let item = items[indexPath.row]
        
        if indexPath.row == 0 {
            cell.roundedType = .topRounded
        } else if indexPath.row == items.count - 1 {
            cell.roundedType = .bottomRounded
        } else {
            cell.roundedType = .none
        }
        
        cell.nameLabel.text = item.name
        cell.infoDescription = item.description
        cell.selectionEnable = item.isURL
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension BioViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let url = URL(string: items[indexPath.row].description)
        if let url = url {
            UIApplication.shared.openURL(url)
        }
    }
}
