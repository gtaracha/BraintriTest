//
//  BlogPostsRequest.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 19.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class BlogPostsRequest: BaseRequest {
    
    convenience init(userName:String) {
        self.init()
        url = "blog/" + userName + "/posts"
    }
}
