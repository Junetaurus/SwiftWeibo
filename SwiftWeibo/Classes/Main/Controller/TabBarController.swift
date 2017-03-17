//
//  TabBarController.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController,TabBarDelegate {
    
    var home: HomeViewController? = nil
    var message: MessageViewController? = nil
    var discover: DiscoverViewController? = nil
    var profile: ProfileViewController? = nil
    
    lazy var items = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpAllChildViewController()
        self.setUpTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setUpAllChildViewController() {
        // 首页
        home = HomeViewController()
        self.setUpOneChildViewController(vc: home!, imageStr: "tabbar_home", selectedImageStr: "tabbar_home_selected", title: "首页")
        // 消息
        message = MessageViewController()
        self.setUpOneChildViewController(vc: message!, imageStr: "tabbar_message_center", selectedImageStr: "tabbar_message_center_selected", title: "消息")
        // 发现
        discover = DiscoverViewController()
        self.setUpOneChildViewController(vc: discover!, imageStr: "tabbar_discover", selectedImageStr: "tabbar_discover_selected", title: "发现")
        // 我
        profile = ProfileViewController()
        self.setUpOneChildViewController(vc: profile!, imageStr: "tabbar_profile", selectedImageStr: "tabbar_profile_selected", title: "我的")
    }
    
    func setUpOneChildViewController(vc: UIViewController, imageStr: String ,selectedImageStr: String, title: String) {
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: imageStr);
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedImageStr)
        items.add(vc.tabBarItem)
        
        let nav = NavigationController.init(rootViewController: vc)
        self.addChildViewController(nav)
        
    }
    
    func setUpTabBar() {
        let tabBar = TabBar.init(frame: CGRect.init(origin: self.tabBar.frame.origin, size: self.tabBar.frame.size))
        tabBar.delegate = self
        tabBar.items = items
        // 添加自定义tabBar
        self.view .addSubview(tabBar)
        // 移除系统的tabBar
        self.tabBar.removeFromSuperview()
    }
    
    
    func tabBarDidClickButton(tabBar: TabBar, index: NSInteger) {
        self.selectedIndex = index
    }
    
    //点击加号按钮的时候调用
    func tabBarDidClickPlusButton(tabBar: TabBar) {
        let composeVC = ComposeViewController()
        let nav = NavigationController.init(rootViewController: composeVC)
        self.present(nav, animated: true, completion: nil)
    }
}
