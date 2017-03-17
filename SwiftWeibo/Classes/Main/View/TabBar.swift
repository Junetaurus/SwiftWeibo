//
//  TabBar.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

protocol TabBarDelegate: NSObjectProtocol {
    
    func tabBarDidClickButton(tabBar: TabBar, index: NSInteger)
    
    //点击加号按钮的时候调用
    func tabBarDidClickPlusButton(tabBar: TabBar)
}

class TabBar: UIView {
    
    lazy var selectedButton = UIButton.init(type: UIButtonType.custom)
    lazy var plusButton = UIButton.init(type: UIButtonType.custom)
    weak var delegate:TabBarDelegate?
    lazy var buttons = NSMutableArray()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        plusButton.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        plusButton.setImage(UIImage.init(named: "tabbar_compose_background_icon_add"), for: UIControlState.highlighted)
        plusButton.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
        plusButton.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        plusButton.sizeToFit()
        plusButton.addTarget(self, action: #selector(plusClick), for: UIControlEvents.touchUpInside)
        self.addSubview(plusButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        
        var btnX: CGFloat = 0;
        let btnY: CGFloat = 0;
        let btnW: CGFloat = w / CGFloat(items.count + 1);
        let btnH: CGFloat = self.bounds.size.height;
        
        var i: CGFloat = 0
        
        for tabBarButton in buttons {
            if i == 2 {
                i = 3
            }
            btnX = i * btnW
            if tabBarButton is TabBarButton {
                let btn = tabBarButton as! TabBarButton
                btn.frame = CGRect.init(x: btnX, y: btnY, width: btnW, height: btnH)
                i = i + 1
            }
            
            // 设置添加按钮的位置
            plusButton.center = CGPoint.init(x: w * 0.5, y: h * 0.5)
        }
    }
    
    var items = NSMutableArray() {
        didSet {
            buttons.removeAllObjects()
            for item in items {
                if item is UITabBarItem{
                    let barItem = item as! UITabBarItem
                    let btn = TabBarButton.init(type: UIButtonType.custom)
                    btn.item = barItem
                    btn.tag = buttons.count;
                    btn.addTarget(self, action: #selector(btnClick(button:)), for: UIControlEvents.touchUpInside)
                    if btn.tag == 0 { // 选中第0个
                        self.btnClick(button: btn)
                    }
                    self.addSubview(btn)
                    // 把按钮添加到按钮数组
                    buttons.add(btn)
                 }
            }
        }
    }
    
    func btnClick(button:UIButton) {
        selectedButton.isSelected = false
        button.isSelected = true
        selectedButton = button
        
        delegate?.tabBarDidClickButton(tabBar: self, index: button.tag)
    }
    
    func plusClick() {
        delegate?.tabBarDidClickPlusButton(tabBar: self)
    }
}
