//
//  DefaultTableViewCell.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class DefaultTableViewCell: BaseTableViewCell {
    private let kLabelVerticalMargin:CGFloat = 10
    private let kLabelHorizontalMargin:CGFloat = 10
    
    private var titleLabel:UILabel!
    
    // MARK: - Initialization -
    convenience init() {
        self.init(style: .default, reuseIdentifier: DefaultTableViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        setupContainer()
        setupLabel()
        setupConstraints()
    }
    
    private func setupLabel() {
        titleLabel = UILabel(forAutoLayout: ())
        titleLabel.numberOfLines = 0
        containerView?.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: kLabelVerticalMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: kLabelVerticalMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: kLabelHorizontalMargin)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: kLabelHorizontalMargin)
        
        setupContainerConstraints()
    }
    
    func setupData(title:String?) {
        titleLabel.text = title
    }
}


