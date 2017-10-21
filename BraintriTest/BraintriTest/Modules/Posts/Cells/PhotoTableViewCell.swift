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
    
    private var photoImageView: UIImageView!//only one at that point

    // MARK: - Initialization -
    convenience init() {
        self.init(style: .default, reuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        selectionStyle = .none
        
        setupContainer()
        setupImageView()
        setupConstraints()
    }
    
    private func setupImageView() {
        photoImageView = UIImageView(forAutoLayout: ())
        photoImageView.contentMode = .scaleAspectFill
        containerView?.addSubview(photoImageView)
    }
    
    private func setupConstraints() {
        photoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: kVerticalSpace)
        photoImageView.autoPinEdge(toSuperviewEdge: .left)
        photoImageView.autoPinEdge(toSuperviewEdge: .right)
        photoImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: kVerticalSpace)
        photoImageView.autoSetDimension(.height, toSize: kImageHeight)
        
        setupContainerConstraints()
    }
    
    func setupData(url:String?) {
        if let url = url {
            photoImageView.sd_setImage(with: URL(string: url))
        }
    }
}
