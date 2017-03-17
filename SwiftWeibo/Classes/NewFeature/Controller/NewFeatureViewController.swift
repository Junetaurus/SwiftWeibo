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

        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        self.collectionView!.setCollectionViewLayout(layout, animated: false)
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
        for i in 0..<4  {
            if getDeviceType() == iPhone4 {
                
            } else {
                
            }
        }
    }
    
    func setUpPageControl() {
        controller = UIPageControl.init()
        controller!.numberOfPages = 4
        controller!.pageIndicatorTintColor = UIColor.black
        controller!.currentPageIndicatorTintColor = UIColor.red
        controller!.center = CGPoint.init(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2 - 30)
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
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        
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
