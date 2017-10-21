//
//  TextTableViewCell.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import Atributika

class TextTableViewCell: BaseTableViewCell {
    private let kLabelVerticalMargin:CGFloat = 10
    private let kLabelHorizontalMargin:CGFloat = 10
    private let kLabelsSpace:CGFloat = 4
    
    private var label:UILabel!
    
    // MARK: - Initialization -
    convenience init() {
        self.init(style: .default, reuseIdentifier: TextTableViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        setupContainer()
        setupLabels()
        setupConstraints()
    }
    
    private func setupLabels() {
        label = UILabel(forAutoLayout: ())
        label.numberOfLines = 0
        containerView?.addSubview(label)
    }
    
    private func setupConstraints() {
        label.autoPinEdge(toSuperviewEdge: .top, withInset: kLabelVerticalMargin)
        label.autoPinEdge(toSuperviewEdge: .left, withInset: kLabelHorizontalMargin)
        label.autoPinEdge(toSuperviewEdge: .right, withInset: kLabelHorizontalMargin)
        label.autoPinEdge(toSuperviewEdge: .bottom, withInset: kLabelVerticalMargin)
        
        setupContainerConstraints()
    }
    
    func setupData(title:String?, body:String?) {
        let allText = NSMutableAttributedString()
        
        if let title = title?.styleAll(StyleProvider.titleStyle).attributedString {
            allText.append(title)
        }
        if let body = body?.style(tags: StyleProvider.linkStyle, StyleProvider.italicStyle).styleAll(StyleProvider.htmlStyle).styleHashtags(StyleProvider.linkStyle).styleMentions(StyleProvider.linkStyle).attributedString {
            if allText.string.characters.count > 0 {
                allText.append("\n\n".styleAll(StyleProvider.newLineStyle).attributedString)
            }
            allText.append(body)
        }
        
        label.attributedText = allText
    }
}
