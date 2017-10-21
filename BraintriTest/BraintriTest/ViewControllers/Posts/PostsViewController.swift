//
//  PostsViewController.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 20.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class PostsViewController: BaseViewController {
    
    private var viewModel:PostsViewModel!
    private var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        viewModel = PostsViewModel(reloadTableViewCallback : reloadTableViewData)
    }
    
    func setupViews() {
        
    }
    
    func reloadTableViewData() {
        tableView.reloadData()
    }
}
