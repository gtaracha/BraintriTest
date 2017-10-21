//
//  ColorProvider.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class ColorProvider: NSObject {
    
    // MARK: - Helpers -
    
    class func createColor(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    class var textColor:UIColor {
        return createColor(red: 68, green: 68, blue: 68, alpha: 1.0)
    }
    
    class var thumblrBackground:UIColor {
        return createColor(red: 53, green: 70, blue: 94, alpha: 1.0)
    }
}
