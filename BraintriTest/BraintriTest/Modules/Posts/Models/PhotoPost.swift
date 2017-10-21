//
//  PhotoPost.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

struct PhotoSize: Decodable {
    let url: String
    let width: Int
    let height: Int
}

struct Photo: Decodable {
    let caption:String
    let altSizes:[PhotoSize]
    let originalSize:PhotoSize
    
    enum CodingKeys: String, CodingKey {
        case caption
        case altSizes = "alt_sizes"
        case originalSize = "original_size"
    }
    
    func getPhotoSizeFor(width:CGFloat) -> PhotoSize {
        var result:PhotoSize? = nil
        for photoSize in altSizes {
            if photoSize.width < Int(width) {
                if let currentResult = result {
                    if currentResult.width < photoSize.width {
                        result = photoSize
                    }
                }
                else {
                    result = photoSize
                }
            }
        }
        
        return result ?? originalSize
    }
}

class PhotoPost: Post {
    let photos: [Photo]
    let caption: String?
    let width: Int?
    let height: Int?
    
    enum CodingKeys: String, CodingKey {
        case photos, caption, width, height
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.photos = try container.decode([Photo].self, forKey: .photos)
        self.caption = try container.decodeIfPresent(String.self, forKey: .caption)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        try super.init(from: decoder)
    }
}

