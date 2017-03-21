//
//  AccountTool.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/21.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

var userAccount: Account? = nil
let AccountFileName = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "account.data"

class AccountTool: NSObject {
    
    class func saveAccount(account: Account) {
        NSKeyedArchiver.archiveRootObject(account, toFile: AccountFileName)
    }
    
    class func account() -> Account {
        if userAccount == nil {
            userAccount = NSKeyedUnarchiver.unarchiveObject(withFile: AccountFileName) as! Account?
            
            // 判断下账号是否过期，如果过期直接返回Nil
            if userAccount == nil {
                userAccount = Account()
            } else {
                if Date().compare((userAccount?.expires_date)!) == ComparisonResult.orderedDescending {
                    userAccount?.access_token = ""
                }

            }
        }
        return userAccount!
    }
}
