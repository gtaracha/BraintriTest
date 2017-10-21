//
//  PostsViewController.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
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
        setupTableView()
        setupConstraints()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    func reloadTableViewData() {
        tableView.reloadData()
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.setUpTableViewCell(indexPath: indexPath, tableView: tableView)
    }
}

