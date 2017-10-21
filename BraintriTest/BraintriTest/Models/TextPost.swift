//
//  TextPost.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 20.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class TextPost: Post {
    let title: String?
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case title, body
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
        try super.init(from: decoder)
    }
}

