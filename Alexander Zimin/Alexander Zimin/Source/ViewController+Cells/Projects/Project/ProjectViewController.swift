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
    var screenShootSize: CGSize = CGSizeZero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
        tableView.registerNib(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
        
        info = project.additionalInfo
        info.insert(InfoItem(name: "Platform", description: project.isMacOs ? "OS X" : "iOS"), atIndex: 0)
        info.insert(InfoItem(name: "Name", description: project.name), atIndex: 0)
        
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
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return screenshotsNames.count > 0 ? 2 : 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && screenshotsNames.count > 0  {
            return 1
        }
        return info.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && screenshotsNames.count > 0  {
            let cell = tableView.dequeueReusableCellWithIdentifier("ScreenshotsCell", forIndexPath: indexPath) as! ScreenshotsTableViewCell
            cell.collectionViewHeightConstraint.constant = screenShootSize.height
            return cell
        }
        
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
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clearColor() }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        info[indexPath.row].doAction()
    }
}

extension ProjectViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshotsNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ScreenshotCell", forIndexPath: indexPath) as! ScreenshotCollectionViewCell
        
        cell.screenshotImageView.image = UIImage(named: screenshotsNames[indexPath.row])
        cell.needToShowFrame = project.isMacOs
        
        return cell
    }
}

extension ProjectViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return screenShootSize
    }
}
