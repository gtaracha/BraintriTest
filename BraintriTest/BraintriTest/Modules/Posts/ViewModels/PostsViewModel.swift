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
    let kBlogName = "importantcreatorcherryblossom"// this temoporary hardcoded
    
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
        let post = posts[indexPath.row]
        
        switch post.type {
        case .quote:
            var cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.reuseIdentifier) as? QuoteTableViewCell
            if cell == nil {
                cell = QuoteTableViewCell()
            }
            let quotePost = post as! QuotePost
            cell?.setupData(text: quotePost.text, source: quotePost.source)
            return cell!
            
        case .photo:
            var cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier) as? PhotoTableViewCell
            if cell == nil {
                cell = PhotoTableViewCell()
            }
            let photoPost = post as! PhotoPost
            cell?.setupData(url: photoPost.photos[0].original_size.url)
            return cell!
            
        case .text:
            var cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.reuseIdentifier) as? TextTableViewCell
            if cell == nil {
                cell = TextTableViewCell()
            }
            let textPost = post as! TextPost
            cell?.setupData(title: textPost.title, body: textPost.body)
            return cell!
            
        default:
            var cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.reuseIdentifier) as? DefaultTableViewCell
            if cell == nil {
                cell = DefaultTableViewCell()
            }
            cell?.setupData(title: post.getTitle())
            return cell!
        }
    }
}
