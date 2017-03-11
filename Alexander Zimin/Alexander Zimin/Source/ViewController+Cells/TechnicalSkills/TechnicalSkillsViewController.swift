//
//  TechnicalSkillsViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 26/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class TechnicalSkillsViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    
    var technicalSkills = TechnicalSkillParser.technicalSkills
    var oppenedCategories: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
        
        tableView.register(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
        tableView.register(UINib(nibName: Constants.plainTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.plainTableViewCellIdentifier)
        tableView.register(UINib(nibName: "SpaceTableViewCell", bundle: nil), forCellReuseIdentifier: "SpaceTableViewCell")
    }
    
    func numberOfElementsInSection(_ section: Int) -> Int {
        return numberOfElementsInSection(section, mechOppened: false)
    }
    
    func numberOfElementsInSection(_ section: Int, mechOppened: Bool) -> Int {
        if oppenedCategories.index(of: section) != nil || mechOppened  {
            return technicalSkills[section].skills.count + 2
        }
        return 1
    }
}

// MARK: - UITableViewDataSource

extension TechnicalSkillsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return technicalSkills.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfElementsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RoundedTableViewCell
        
        switch indexPath.row {
        case 0:
            cell = titleCell(tableView, cellForRowAtIndexPath: indexPath)
        case 1:
            cell = acquiredCell(tableView, cellForRowAtIndexPath: indexPath)
        default:
            cell = skillCell(tableView, cellForRowAtIndexPath: indexPath)
        }
        
        let numberOfElements = numberOfElementsInSection(indexPath.section)
        
        if numberOfElements == 1 {
            cell.roundedType = .allRounded
        } else if indexPath.row == 0 {
            cell.roundedType = .topRounded
        } else if indexPath.row == numberOfElements - 1 {
            cell.roundedType = .bottomRounded
        } else {
            cell.roundedType = .none
        }
        
        return cell
    }
}

// MARK: - Cells

extension TechnicalSkillsViewController {
    func titleCell(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> RoundedTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.plainTableViewCellIdentifier, for: indexPath) as! PlainTableViewCell
        
        cell.nameLabel.text = technicalSkills[indexPath.section].name
        cell.selectionEnable = true
        
        return cell
    }
    
    func acquiredCell(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> RoundedTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.infoTableViewCellIdentifier, for: indexPath) as! InfoTableViewCell
        
        cell.selectionEnable = false
        cell.nameLabel.text = "Info"
        cell.infoDescription = technicalSkills[indexPath.section].description
        
        return cell
    }
    
    func skillCell(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> RoundedTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.plainTableViewCellIdentifier, for: indexPath) as! PlainTableViewCell
        
        cell.nameLabel.text = technicalSkills[indexPath.section].skills[indexPath.row - 2]
        cell.nameLabel.textColor = UIColor.contentAdditionalElementsColor
        cell.selectionEnable = false
        
        return cell
    }
}


// MARK: - UITableViewDelegate

extension TechnicalSkillsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! PlainTableViewCell
        
        tableView.beginUpdates()
        tableView.deselectRow(at: indexPath, animated: true)
        
        var indexPathes: [IndexPath] = []
        for i in 1..<numberOfElementsInSection(indexPath.section, mechOppened: true) {
            indexPathes.append(IndexPath(row: i, section: indexPath.section))
        }
        
        if let index = oppenedCategories.index(of: indexPath.section) {
            oppenedCategories.remove(at: index)
            tableView.deleteRows(at: indexPathes, with: UITableViewRowAnimation.fade)
            
            cell.setOpened(false, animated: true, complition: { () -> () in
                cell.roundedType = .allRounded
            })
            
        } else {
            oppenedCategories.append(indexPath.section)
            tableView.insertRows(at: indexPathes, with: UITableViewRowAnimation.fade)
            
            cell.roundedType = .topRounded
            cell.setOpened(true, animated: true)
        }
        
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clear }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
}
