//
//  VideoPost.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

struct Player: Decodable {
    let width: Int
    let embedCode: String
    
    enum CodingKeys: String, CodingKey {
        case width, embedCode = "embed_code"
    }
}

class VideoPost: Post {
    let caption: String?
    let player: [Player]
    
    enum CodingKeys: String, CodingKey {
        case caption, player
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        self.player = try container.decode([Player].self, forKey: .player)
        try super.init(from: decoder)
    }
    
    func getPlayerFor(width:CGFloat) -> Player? {
        var result:Player? = nil
        for video in player {
            if video.width < Int(width) {
                if let currentResult = result {
                    if currentResult.width < video.width {
                        result = video
                    }
                }
                else {
                    result = video
                }
            }
        }
        
        return result
    }
}
