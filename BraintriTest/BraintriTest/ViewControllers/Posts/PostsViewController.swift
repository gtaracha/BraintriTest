//
//  PostsViewController.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 20.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class PostsViewController: BaseViewController {
    
    private var viewModel:PostsViewModel = PostsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestPosts(blogName: "test", successCompletionHandler: {
            print("success")
        }) { (error) in
           print("fail")
        }
    }
}
