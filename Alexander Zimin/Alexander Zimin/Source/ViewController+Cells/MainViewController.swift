//
//  MainViewController.swift
//  Alexander Zimin
//
//  Created by Alex Zimin on 25/04/15.
//  Copyright (c) 2015 Alex Zimin. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var items: [MenuItem] = MenuItemsParser.menuItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfItemsPerSmallerSide: CGFloat = 2
        let width = (min(screenSize.height, screenSize.width) - Apperance.defaultSpace * 3) / numberOfItemsPerSmallerSide
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: width, height: 166)
        layout?.minimumLineSpacing = Apperance.defaultSpace
        layout?.minimumInteritemSpacing = Apperance.defaultSpace
        
        collectionView.contentInset = UIEdgeInsets(top: Apperance.defaultSpace, left: Apperance.defaultSpace, bottom: Apperance.defaultSpace, right: Apperance.defaultSpace)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MenuItem", forIndexPath: indexPath) as! MenuItemCollectionViewCell
        
        let item = items[indexPath.row]
        
        cell.categoryNameLabel.text = item.name
        cell.iconImage.image = UIImage(named: item.imageName)
        cell.fillWithColor(item.color)
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        appColor.updateColor(items[indexPath.row].color) 
        self.performSegueWithIdentifier(items[indexPath.row].segueIdentifier, sender: nil)
    }
    
    
}

