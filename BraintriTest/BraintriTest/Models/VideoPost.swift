//
//  VideoPost.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 20.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class VideoPost: Post {
    let caption: String?
    
    enum CodingKeys: String, CodingKey {
        case caption
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        try super.init(from: decoder)
    }
}
