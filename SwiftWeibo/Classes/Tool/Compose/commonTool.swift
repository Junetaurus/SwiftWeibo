//
//  commonTool.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/17.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class commonTool: NSObject {
    
    //NSString计算
    class func getTextRectSize(text:NSString,font:UIFont,size:CGSize,option:NSStringDrawingOptions) -> CGRect {
        let attributes = [NSFontAttributeName: font]
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect;
    }
}
