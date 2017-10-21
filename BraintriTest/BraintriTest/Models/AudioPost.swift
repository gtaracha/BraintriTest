//
//  AudioPost.swift
//  BraintriTest
//
//  Created by Joanna Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class AudioPost: Post {
    let artist: String?
    let album: String?
    let trackName: String?
    
    private enum CodingKeys: String, CodingKey {
        case artist, album
        case trackName = "track_name"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artist = try container.decodeIfPresent(String.self, forKey: .artist)
        self.album = try container.decodeIfPresent(String.self, forKey: .album)
        self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        try super.init(from: decoder)
    }
}
