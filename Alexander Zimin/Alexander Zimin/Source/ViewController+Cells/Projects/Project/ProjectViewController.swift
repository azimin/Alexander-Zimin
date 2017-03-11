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
    weak var collectionView: UICollectionView!
    
    var project: Project!
    var info: [InfoItem] = []
    var screenshotsNames: [String] = []
    var screenShootSize: CGSize = CGSize.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
        tableView.register(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
        
        info = project.additionalInfo
        info.insert(InfoItem(name: "Platform", description: project.isMacOs ? "OS X" : "iOS"), at: 0)
        info.insert(InfoItem(name: "Name", description: project.name), at: 0)
        
        screenshotsNames = project.screenshotsNames
        
        if project.isMacOs {
            screenShootSize = CGSize(width: 300, height: 188)
        } else {
            screenShootSize = CGSize(width: 166, height: 295)
        }
    }

}

// MARK: - UITableViewDataSource

extension ProjectViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return screenshotsNames.count > 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && screenshotsNames.count > 0  {
            return 1
        }
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && screenshotsNames.count > 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScreenshotsCell", for: indexPath) as! ScreenshotsTableViewCell
            cell.collectionViewHeightConstraint.constant = screenShootSize.height
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.infoTableViewCellIdentifier, for: indexPath) as! InfoTableViewCell
        
        if indexPath.row == 0 {
            cell.roundedType = .topRounded
        } else if indexPath.row == info.count - 1 {
            cell.roundedType = .bottomRounded
        } else {
            cell.roundedType = .none
        }
        
        if info.count == 1 {
            cell.roundedType = .allRounded
        }
        
        cell.nameLabel.text = info[indexPath.row].name
        cell.infoDescription = info[indexPath.row].description
        cell.selectionEnable = info[indexPath.row].isURL
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProjectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clear }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        info[indexPath.row].doAction()
    }
}

extension ProjectViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshotsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenshotCell", for: indexPath) as! ScreenshotCollectionViewCell
        
        cell.screenshotImageView.image = UIImage(named: screenshotsNames[indexPath.row])
        cell.needToShowFrame = project.isMacOs
        
        return cell
    }
}

extension ProjectViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return screenShootSize
    }
}
