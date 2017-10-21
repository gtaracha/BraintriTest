//
//  LinkPost.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class LinkPost: Post {
    let title: String?
    let url: URL
    let author: String?
    
    enum CodingKeys: String, CodingKey {
        case title, url, author
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decode(URL.self, forKey: .url)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        try super.init(from: decoder)
    }
    
    override func getTitle() -> String? {
        return type.rawValue + " " + (title ?? "")
    }
}

