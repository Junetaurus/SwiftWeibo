//
//  RootTool.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class RootTool: NSObject {

    class func chooseRootViewController(window : UIWindow) {
        
        let currentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? ""
        
        let lastVersion = UserDefaults.standard.object(forKey: "version") as? String ?? ""
        
        if currentVersion == lastVersion {
            let tab = TabBarController()
            window.rootViewController = tab;
            
        } else {
            let layout = UICollectionViewFlowLayout.init()
            layout.itemSize = UIScreen.main.bounds.size
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .horizontal
            let vc = NewFeatureViewController.init(collectionViewLayout: layout)
            window.rootViewController = vc;
            UserDefaults.standard.set(currentVersion, forKey: "version")
        }
    }
}
