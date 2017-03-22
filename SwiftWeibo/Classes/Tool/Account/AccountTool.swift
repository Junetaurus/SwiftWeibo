//
//  AccountTool.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/21.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class AccountTool: NSObject {
    
    class func saveAccount(account: Account) {
        UserDefaults.standard.set(account.uid, forKey: "uid")
        UserDefaults.standard.set(account.access_token, forKey: "access_token")
        UserDefaults.standard.set(account.expires_in, forKey: "expires_in")
        UserDefaults.standard.set(account.remind_in, forKey: "remind_in")
        UserDefaults.standard.synchronize()
    }
    
    class func account() -> Account {
        let userAccount = Account()
        userAccount.expires_in = UserDefaults.standard.object(forKey: "expires_in") == nil ? "" : UserDefaults.standard.object(forKey: "expires_in") as! String
        if userAccount.expires_in == "" {
            
        } else {
            userAccount.uid = UserDefaults.standard.object(forKey: "uid") as! String
            userAccount.access_token = UserDefaults.standard.object(forKey: "access_token") as! String
            userAccount.remind_in = UserDefaults.standard.object(forKey: "remind_in") as! String
        }
        return userAccount
    }
}
