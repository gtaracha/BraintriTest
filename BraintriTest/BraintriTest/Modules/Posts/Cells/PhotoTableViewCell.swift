//
//  PhotoTableViewCell.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoTableViewCell: BaseTableViewCell {
    private let kImageHeight:CGFloat = 300
    private let kVerticalSpace:CGFloat = 10
    
    private var photoImageView:[UIImageView] = []

    // MARK: - Initialization -
    convenience init() {
        self.init(style: .default, reuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        setupContainer()
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupContainerConstraints()
    }
    
    func setupData(urls:[String?]) {
        for imageView in photoImageView {
            imageView.removeFromSuperview()
        }
        photoImageView.removeAll()
        
        var lastView:UIView? = nil
        for (index, url) in urls.enumerated() {
            if let url = url {
                let photoImageView = UIImageView(forAutoLayout: ())
                photoImageView.contentMode = .scaleAspectFill
                containerView?.addSubview(photoImageView)
                
                if index == 0 {
                    photoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: kVerticalSpace)
                }
                else {
                    photoImageView.autoPinEdge(.top, to: .bottom, of: lastView!)
                }
                photoImageView.autoPinEdge(toSuperviewEdge: .left)
                photoImageView.autoPinEdge(toSuperviewEdge: .right)
                photoImageView.autoSetDimension(.height, toSize: kImageHeight)
                if urls.count - 1 == index {
                    photoImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: kVerticalSpace)
                }
                
                photoImageView.sd_setImage(with: URL(string: url))
                lastView = photoImageView
                
            }
        }
    }
}
