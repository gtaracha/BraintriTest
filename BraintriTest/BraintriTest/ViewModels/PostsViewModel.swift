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
    var posts:[Post] = []
    
    func requestPosts(blogName:String, successCompletionHandler:@escaping (() -> Void), failureCompletionHandler:@escaping ((_ code:APIErrorCode?) -> Void)) {
        let request = BlogPostsRequest(blogName: blogName)
        request.successResponseHandler = {
            (response:DataResponse<Posts>?) -> Void in
            if let posts = response?.value {
                self.posts = posts.posts
                successCompletionHandler()
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
