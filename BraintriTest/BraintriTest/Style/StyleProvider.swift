//
//  StyleProvider.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit
import Atributika

class StyleProvider: NSObject {
    
    class var titleStyle:Style {
        get {
            return Style.font(.boldSystemFont(ofSize: 32))
                        .foregroundColor(ColorProvider.textColor, .normal)
        }
    }
    
    class var italicStyle:Style {
        get {
            return Style("i").font(.italicSystemFont(ofSize: 16))
        }
    }
    
    class var linkStyle:Style {
        get {
            return Style("a")
                .font(.boldSystemFont(ofSize: 16))
                .foregroundColor(.black, .normal)
                .foregroundColor(.brown, .highlighted)
        }
    }
    
    class var htmlStyle:Style {
        get {
            return Style.font(.systemFont(ofSize: 16)).foregroundColor(ColorProvider.textColor, .normal)
        }
    }
    
    class var newLineStyle:Style {
        get {
            return Style.font(.systemFont(ofSize: 16))
        }
    }
}
