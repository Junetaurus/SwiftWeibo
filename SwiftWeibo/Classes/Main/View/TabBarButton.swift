//
//  TabBarButton.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class TabBarButton: UIButton {
    
    var item: UITabBarItem? {
        didSet {
            self.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: Optional.none)
            self.addObserver(self, forKeyPath: "image", options: NSKeyValueObservingOptions.new, context: Optional.none)
            self.addObserver(self, forKeyPath: "selectedImage", options: NSKeyValueObservingOptions.new, context: Optional.none)
            self.addObserver(self, forKeyPath: "badgeValue", options: NSKeyValueObservingOptions.new, context: Optional.none)
        }
    }
    
    
    var badgeView: BadgeView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.setTitleColor(UIColor.orange, for: UIControlState.selected)
        
        self.imageView?.contentMode = UIViewContentMode.center
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        self.badgeView = BadgeView(type: UIButtonType.custom)
        self.addSubview(self.badgeView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
}
