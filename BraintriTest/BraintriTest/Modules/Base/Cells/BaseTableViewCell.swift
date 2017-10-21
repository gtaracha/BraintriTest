//
//  BaseTableViewCell.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    private let kContainerVerticalSpace:CGFloat = 10
    private let kContainerHorizontalSpace:CGFloat = 5
    
    var containerView:UIView?
    
    class var reuseIdentifier:String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    func setupContainer() {
        backgroundColor = UIColor(red: 53.0/255.0, green: 70.0/255.0, blue: 94.0/255.0, alpha: 1.0)
        
        containerView = UIView(forAutoLayout: ())
        containerView?.backgroundColor = UIColor.white
        containerView?.layer.cornerRadius = 5
        containerView?.clipsToBounds = true
        addSubview(containerView!)
    }
    
    func setupContainerConstraints() {
        containerView?.autoPinEdge(toSuperviewEdge: .left, withInset: kContainerVerticalSpace)
        containerView?.autoPinEdge(toSuperviewEdge: .right, withInset: kContainerHorizontalSpace)
        containerView?.autoPinEdge(toSuperviewEdge: .bottom, withInset: kContainerVerticalSpace)
        containerView?.autoPinEdge(toSuperviewEdge: .top, withInset: kContainerVerticalSpace)
    }
}
