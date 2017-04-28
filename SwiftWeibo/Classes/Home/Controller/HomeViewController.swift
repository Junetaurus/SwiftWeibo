//
//  HomeViewController.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getTheLatestPublicWeibo(page: 1)
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:返回最新的公共微博
    func getTheLatestPublicWeibo(page: NSInteger)  {
        
        if AccountTool.account().access_token == "" {
            return
        } else {
            let params = NSMutableDictionary.init()
            params["access_token"] = AccountTool.account().access_token
            params["page"] = String(stringInterpolationSegment: page)
            
            HttpTool.shared.request(type: .GET, urlString: "https://api.weibo.com/2/statuses/public_timeline.json", paramters: params as? [String : Any]) { (result) in
                
            }
        }
    }
}




