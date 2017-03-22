//
//  HttpTool.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/20.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class HttpTool: NSObject {
    
    //MARK:单例模式
    static let shared = HttpTool()
    private override init() {}
    
    
     //MARK: request
    func request(type: MethodType, urlString: String, paramters: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        // 获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        // 发送网络请求
        Alamofire.request(urlString, method: method, parameters: paramters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? "请求失败")
                return
            }
            // 回调
            finishedCallback(result as AnyObject)
        }
    }
}
