//
//  NewFeatureViewController.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/17.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class NewFeatureViewController: UICollectionViewController {
    
    var controller: UIPageControl? = nil
    lazy var imageArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(NewFeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.isPagingEnabled = true
        self.collectionView!.bounces = false
        self.collectionView!.showsHorizontalScrollIndicator = false
        
        self.setDateSource()
        self.setUpPageControl()
        // Do any additional setup after loading the view.
    }
    
    func setDateSource() {
        imageArray.removeAllObjects()
        for i in 1..<5  {
            var imageName = ""
            if getDeviceType() == iPhone4 {
                imageName = "new_feature_" + String(i)
                imageArray.add(imageName)
            } else {
                imageName = "new_feature_" + String(i) + "-568h"
                imageArray.add(imageName)
            }
        }
    }
    
    func setUpPageControl() {
        controller = UIPageControl.init()
        controller!.numberOfPages = imageArray.count
        controller!.pageIndicatorTintColor = UIColor.black
        controller!.currentPageIndicatorTintColor = UIColor.red
        controller!.center = CGPoint.init(x: ScreenWidth / 2, y: ScreenHeight - 30)
        self.view.addSubview(controller!)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
        controller!.currentPage = NSInteger(page)
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let myCell = cell as! NewFeatureCell
        
        let image: UIImage = UIImage.init(named: imageArray[indexPath.item] as! String)!
        myCell.image = image
        
        myCell.setIndexPathWithCount(indexPath: indexPath as NSIndexPath, count: imageArray.count)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
