//
//  ComposeViewController.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    var rightBtn: UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavgationBar()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavgationBar() {
        self.title = "发送微博"
        // left
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(dismissComposeVc))
        
        //right
        rightBtn = UIButton.init(type: UIButtonType.custom)
        rightBtn!.setTitle("发送", for: UIControlState.normal)
        rightBtn!.setTitleColor(UIColor.orange, for: UIControlState.normal)
        rightBtn!.setTitleColor(UIColor.lightGray, for: UIControlState.disabled)
        rightBtn!.sizeToFit()
        rightBtn!.isEnabled = false;
        rightBtn!.addTarget(self, action: #selector(compose), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn!)
    }
    
    func setUpToolBar() {
        
    }
    
    func dismissComposeVc() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func compose() {
        
    }
}
