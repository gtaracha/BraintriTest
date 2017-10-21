//
//  VideoTableViewCell.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class VideoTableViewCell: BaseTableViewCell {
    private var webView:UIWebView!
    private let kImageHeight:CGFloat = 300
    
    // MARK: - Initialization -
    convenience init() {
        self.init(style: .default, reuseIdentifier: VideoTableViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        setupContainer()
        setupLabels()
        setupConstraints()
    }
    
    private func setupLabels() {
        webView = UIWebView(forAutoLayout: ())
        containerView?.addSubview(webView)
    }
    
    private func setupConstraints() {
        webView.autoPinEdgesToSuperviewEdges()
        webView.autoSetDimension(.height, toSize: kImageHeight)
        
        setupContainerConstraints()
    }
    
    func setupData(html:String?) {
        if let html = html {
            webView.loadHTMLString(html, baseURL: nil)
        }
    }
}
