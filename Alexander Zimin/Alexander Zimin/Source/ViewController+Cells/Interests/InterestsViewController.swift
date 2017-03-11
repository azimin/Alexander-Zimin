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
        
        tableView.register(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
        tableView.register(UINib(nibName: Constants.imageTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.imageTableViewCellIdentifier)
    }

}

// MARK: - UITableViewDataSource

extension InterestsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return interests.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.imageTableViewCellIdentifier, for: indexPath) as! ImageTableViewCell
            
            cell.roundedType = .topRounded
            cell.nameLabel.text = interests[indexPath.section].name
            cell.iconImageView.image = UIImage(named: interests[indexPath.section].imageName)?.imageWithColor(UIColor.contentElementsColor)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.infoTableViewCellIdentifier, for: indexPath) as! InfoTableViewCell
            
            cell.roundedType = .bottomRounded
            cell.nameLabel.text = "Personal"
            cell.infoDescription = interests[indexPath.section].description
            cell.selectionEnable = false
            
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension InterestsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clear }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
}
