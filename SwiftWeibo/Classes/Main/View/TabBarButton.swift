//
//  TabBarButton.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

let ImageRidio: CGFloat = 0.7

class TabBarButton: UIButton {
    
    var item: UITabBarItem? {
        didSet {
            self.observeValue(forKeyPath: nil, of: nil, change: nil, context: nil)
            // KVO：时刻监听一个对象的属性有没有改变
            item!.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
            item!.addObserver(self, forKeyPath: "image", options: NSKeyValueObservingOptions.new, context: nil)
            item!.addObserver(self, forKeyPath: "selectedImage", options: NSKeyValueObservingOptions.new, context: nil)
            item!.addObserver(self, forKeyPath: "badgeValue", options: NSKeyValueObservingOptions.new, context: nil)
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
        
        self.setTitle(item!.title, for: UIControlState.normal)
        
        self.setImage(item!.image, for: UIControlState.normal)
        
        self.setImage(item!.selectedImage, for: UIControlState.selected)
        
         // 设置badgeValue
        badgeView?.badgeValue = item!.badgeValue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 1.imageView
        let imageX: CGFloat = 0
        let imageY: CGFloat = 0
        let imageW: CGFloat = self.bounds.size.width
        let imageH: CGFloat = self.bounds.size.height * ImageRidio
        self.imageView?.frame = CGRect.init(x: imageX, y: imageY, width: imageW, height: imageH)
        
        // 2.title
        let titleX: CGFloat = 0;
        let titleY: CGFloat = imageH - 3;
        let titleW: CGFloat = self.bounds.size.width;
        let titleH: CGFloat = self.bounds.size.height - titleY
        self.titleLabel?.frame = CGRect.init(x: titleX, y: titleY, width: titleW, height: titleH)
        
        // 3.badgeView
        self.badgeView?.frame.origin.x = self.bounds.size.width - (self.badgeView?.bounds.size.width)! - 10;
        self.badgeView?.frame.origin.y = 0;
    }
}
