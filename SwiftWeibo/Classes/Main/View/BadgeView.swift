//
//  BadgeView.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

let BadgeViewFont = UIFont.systemFont(ofSize: 11)

class BadgeView: UIButton {
    
    var badgeValue: String? {
        didSet {
            if badgeValue?.isEmpty == true || badgeValue == nil{
                self.isHidden = true;
            } else {
                if badgeValue! == "0" {
                    self.isHidden = true;
                } else {
                    self.isHidden = false;
                }
                self.setTitle(badgeValue!, for: UIControlState.normal)
            }
            self.setBackgroundImage(UIImage.init(named: "main_badge"), for: UIControlState.normal)
            self.setImage(nil, for: UIControlState.normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false;
        self.setBackgroundImage(UIImage.init(named: "main_badge"), for: UIControlState.normal)
        self.titleLabel?.font = BadgeViewFont
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
