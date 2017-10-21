//
//  PostsViewModel.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import Alamofire

class PostsViewModel: NSObject {
    let kNumberOfSections = 1
    let kBlogName = "holysheerios"
    
    private var reloadTableViewCallback : (()->())!
    private var posts:[Post] = []
    
    init(reloadTableViewCallback : @escaping (()->())) {
        super.init()
        
        self.reloadTableViewCallback = reloadTableViewCallback
        retrieveData()
    }
    
    private func retrieveData() {
        requestPosts(blogName: kBlogName, successCompletionHandler: { [weak self] in
            self?.reloadTableViewCallback()
        }) { (error) in
            
        }
    }
    
    private func requestPosts(blogName:String, successCompletionHandler:@escaping (() -> Void), failureCompletionHandler:@escaping ((_ code:APIErrorCode?) -> Void)) {
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
    
    func numberOfRowsInSection(section : Int) -> Int {
        return posts.count
    }
    
    func numberOfSections() -> Int {
        return kNumberOfSections
    }
    
    func setUpTableViewCell(indexPath : IndexPath, tableView : UITableView) -> UITableViewCell {
        let dataObject = posts[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.reuseIdentifier) as? PostsTableViewCell
        if cell == nil {
            cell = PostsTableViewCell()
        }
        cell?.setupData(title: dataObject.getTitle())
        
        return cell!
    }
}
