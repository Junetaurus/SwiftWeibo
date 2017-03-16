//
//  BadgeView.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

var item: UITabBarItem?

class BadgeView: UIButton {
    
    var badgeView: BadgeView {
        let view = BadgeView()
        return view
    }
    
    override func draw(_ rect: CGRect) {
        self.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.setTitleColor(UIColor.orange, for: UIControlState.selected)
        
        self.imageView?.contentMode = UIViewContentMode.center
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
}
