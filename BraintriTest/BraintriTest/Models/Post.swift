//
//  Post.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 20.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class Post: Decodable {
    let id: Int
    let postUrl: String
    let type: String
    let timestamp:TimeInterval
    let tags: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case postUrl = "post_url"
        case type, timestamp, tags
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        postUrl = try container.decode(String.self, forKey: .postUrl)
        type = try container.decode(String.self, forKey: .type)
        timestamp = try container.decode(TimeInterval.self, forKey: .timestamp)
        tags = try container.decodeIfPresent([String].self, forKey: .tags)
    }
}