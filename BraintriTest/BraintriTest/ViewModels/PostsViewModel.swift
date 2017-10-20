//
//  PostsViewModel.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 20.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import Alamofire

class PostsViewModel: NSObject {
    var posts:Posts!
    
    func requestPosts(for userName:String, successCompletionHandler:@escaping (() -> Void), failureCompletionHandler:@escaping ((_ code:APIErrorCode?) -> Void)) {
        let request = BlogPostsRequest(userName: userName)
        request.successResponseHandler = {
            (response:DataResponse<Any>?) -> Void in
            if let responseDict = response?.result.value as? [String : AnyObject] {
                
                if let items = responseDict["items"] as? [NSDictionary] {
                    
                   
                    successCompletionHandler()
                }
                else {
                    successCompletionHandler()
                }
            }
            else {
                failureCompletionHandler(nil)
            }
        }
        
        request.failureResponseHandler = {
            failureCompletionHandler($1)
        }
        APIClient.sharedInstance.sendRequest(request: request)
    }
}
