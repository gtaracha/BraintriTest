//
//  QuotePost.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class QuotePost: Post {
    let text: String?
    let source: String?
    
    enum CodingKeys: String, CodingKey {
        case text, source
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        try super.init(from: decoder)
    }
}

