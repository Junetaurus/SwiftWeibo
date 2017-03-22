//
//  Account.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/21.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class Account: NSObject {
    
    /// 获取数据的访问命令牌
    var access_token: String = ""
    
    /// 账号的有效期
    var expires_in: String = ""
    
    /// 用户唯一标识符
    var uid: String = ""
    
    /// 过期时间 = 当前保存时间+有效期
    var expires_date: Date?
    
    /// 账号的有效期
    var remind_in: String = ""
    
    /// 用户的昵称
    var name: String = ""

}
