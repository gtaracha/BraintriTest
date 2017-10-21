//
//  QuoteTableViewCell.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class QuoteTableViewCell: BaseTableViewCell {
    private let kLabelVerticalMargin:CGFloat = 10
    private let kLabelHorizontalMargin:CGFloat = 10
    private let kLabelsSpace:CGFloat = 4
    
    private var label:UILabel!
    
    // MARK: - Initialization -
    convenience init() {
        self.init(style: .default, reuseIdentifier: QuoteTableViewCell.reuseIdentifier)
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
    
    func setupData(text: String?, source: String?) {
        let allText = NSMutableAttributedString()
        
        if let text = text?.styleAll(StyleProvider.titleStyle).attributedString {
            allText.append("“".styleAll(StyleProvider.titleStyle).attributedString)
            allText.append(text)
            allText.append("”".styleAll(StyleProvider.titleStyle).attributedString)
        }
        if let source = source?.style(tags: StyleProvider.linkStyle, StyleProvider.italicStyle).styleAll(StyleProvider.htmlStyle).styleHashtags(StyleProvider.linkStyle).styleMentions(StyleProvider.linkStyle).attributedString {
            if allText.string.characters.count > 0 {
                allText.append("\n\n— ".styleAll(StyleProvider.newLineStyle).attributedString)
            }
            allText.append(source)
        }
        
        label.attributedText = allText
    }

}
