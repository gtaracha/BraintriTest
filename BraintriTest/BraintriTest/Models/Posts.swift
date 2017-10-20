//
//  Posts.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 20.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

struct VideoPost: Codable {
    
}

struct PhotoPost: Codable {
    
}

struct RegularPost: Codable {
    let regularTitle: String
    let regularBody: String

    enum CodingKeys: String, CodingKey {
        case regularTitle = "regular-title"
        case regularBody = "regular-body"
    }
}

struct QuotePost: Codable {
    let quoteText: String
    let quoteSource: String
    
    enum CodingKeys: String, CodingKey {
        case quoteText = "quote-text"
        case quoteSource = "quote-source"
    }
}


enum Posts: Decodable {
    case quotePost(QuotePost)
    case regularPost(RegularPost)
}

extension Posts {
    enum CodingKeys: String, CodingKey {
        case quotePost, regularPost
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let quotePost = try container.decodeIfPresent(QuotePost.self, forKey: .quotePost) {
            self = .quotePost(quotePost)
        } else if let regularPost = try container.decodeIfPresent(RegularPost.self, forKey: .regularPost){
            self = .regularPost(regularPost)
        }
        else {
            self = .regularPost(RegularPost(regularTitle: "", regularBody: ""))
        }
    }
}
