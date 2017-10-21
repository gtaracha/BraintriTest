//
//  BaseTableViewCell.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    class var reuseIdentifier:String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

}
