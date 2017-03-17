//
//  SwiftWeibo.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/17.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import Foundation
import UIKit

let ScreenWidth: CGFloat = UIScreen.main.bounds.size.width
let ScreenHeight: CGFloat = UIScreen.main.bounds.size.height
let ScreenMax: CGFloat = max(ScreenWidth, ScreenHeight)
let ScreenMin: CGFloat = min(ScreenWidth, ScreenHeight)

let iPhone4: String  = "iPhone4"
let iPhone5: String  = "iPhone5"
let iPhone6: String  = "iPhone6"
let iPhone6P: String  = "iPhone6P"

func getDeviceType() -> String {
    if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
        if ScreenMax < 568.0 {
            return iPhone4
        }
        if ScreenMax == 568.0 {
            return iPhone5
        }
        if ScreenMax == 667.0 {
            return iPhone6
        }
        if ScreenMax == 736.0 {
            return iPhone6P
        }
    }
    return ""
}
