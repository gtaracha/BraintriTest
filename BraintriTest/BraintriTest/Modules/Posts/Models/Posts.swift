//
//  Posts.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

struct Posts: Decodable {
    let posts: [Post]
    
    enum PostsKey: CodingKey {
        case posts
    }
    
    enum PostTypeKey: CodingKey {
        case type
    }
    
    enum PostType: String, Decodable {
        case text, quote, link, answer, video, audio, photo, chat
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PostsKey.self)
        var postsArrayForType = try container.nestedUnkeyedContainer(forKey: PostsKey.posts)
        var posts = [Post]()
        
        var postsArray = postsArrayForType
        while(!postsArrayForType.isAtEnd)
        {
            let post = try postsArrayForType.nestedContainer(keyedBy: PostTypeKey.self)
            let type = try post.decode(PostType.self, forKey: PostTypeKey.type)
            switch type {
            case .answer:
                posts.append(try postsArray.decode(AnswerPost.self))
            case .chat:
                posts.append(try postsArray.decode(ChatPost.self))
            case .audio:
                posts.append(try postsArray.decode(AudioPost.self))
            case .text:
                posts.append(try postsArray.decode(TextPost.self))
            case .quote:
                posts.append(try postsArray.decode(QuotePost.self))
            case .link:
                posts.append(try postsArray.decode(LinkPost.self))
            case .video:
                posts.append(try postsArray.decode(VideoPost.self))
            case .photo:
                posts.append(try postsArray.decode(PhotoPost.self))
            }
        }
        self.posts = posts
    }
}

