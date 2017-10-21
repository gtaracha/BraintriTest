//
//  PostsTableViewCell.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import Atributika

class PostsTableViewCell: BaseTableViewCell {
    private let kLabelVerticalMargin:CGFloat = 10
    private let kLabelHorizontalMargin:CGFloat = 10
    private let kSeparatorHeight:CGFloat = 0.5
    
    private var titleLabel:UILabel!
    private var separatorView:UIView!
    
    // MARK: - Initialization -
    convenience init() {
        self.init(style: .default, reuseIdentifier: PostsTableViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        setupLabel()
        setupSeparator()
        setupConstraints()
    }
    
    private func setupLabel() {
        titleLabel = UILabel(forAutoLayout: ())
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
    }

    private func setupSeparator() {
        separatorView = UIView(forAutoLayout: ())
        separatorView.backgroundColor = UIColor.darkGray
        addSubview(separatorView)
    }
    
    private func setupConstraints() {
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: kLabelVerticalMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: kLabelVerticalMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: kLabelHorizontalMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: kLabelHorizontalMargin)

        separatorView.autoPinEdge(toSuperviewEdge: .left)
        separatorView.autoPinEdge(toSuperviewEdge: .right)
        separatorView.autoPinEdge(toSuperviewEdge: .bottom)
        separatorView.autoSetDimension(.height, toSize: kSeparatorHeight)
    }
    
    func setupData(title:String?) {
        let all = Style.font(.systemFont(ofSize: 16))
        let link = Style("a")
            .font(.boldSystemFont(ofSize: 16))
            .foregroundColor(.black, .normal)
            .foregroundColor(.brown, .highlighted)
        let i = Style("i").font(.italicSystemFont(ofSize: 16))
        
        titleLabel.attributedText = title?.style(tags: link, i)
            .styleAll(all)
            .styleHashtags(link)
            .styleMentions(link).attributedString
    }
}
