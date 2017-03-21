//
//  OAuthViewController.swift
//  SwiftWeibo
//
//  Created by ZhangJun on 2017/3/16.
//  Copyright © 2017年 Taurus. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initWebView()
    }
    
    func initWebView() {
        let urlStr =  AuthorizeBaseUrl + "?client_id=" + Client_id + "&redirect_uri=" + Redirect_uri
        
        let webView = UIWebView.init(frame: self.view.frame)
        webView.loadRequest(URLRequest.init(url: NSURL.init(string: urlStr) as! URL))
        webView.delegate = self;
        self.view.addSubview(webView)
    }
    
    //MARK: UIWebViewDelegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let urlStr = request.url?.absoluteString
        
        let range = urlStr?.range(of: "code=")
        
        if range != nil {
            if !(range?.isEmpty)! {
                let code = urlStr?.substring(from: (range?.upperBound)!)
                self.accessTokenWithCode(code: code!)
            }
        }
        
        return true
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    
    /*
     
     必选	类型及范围	说明
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     
     grant_type为authorization_code时
     必选	类型及范围	说明
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
     
     */
    func accessTokenWithCode(code: String) {
        let params = NSMutableDictionary()
        params["client_id"] = Client_id;
        params["client_secret"] = Client_secret;
        params["grant_type"] = "authorization_code";
        params["code"] = code;
        params["redirect_uri"] = Redirect_uri;

        HttpTool.shared.postRequest(urlString: "https://api.weibo.com/oauth2/access_token", params: (params as NSDictionary) as! [String : Any] , success: { (response: [String: AnyObject]) in
            
        }) { (error: Error) in
            
        }
    }
}
