//
//  AnswerPost.swift
//  BraintriTest
//
//  Created by Grzegorz Taracha on 21.10.2017.
//  Copyright © 2017 Grzegorz Taracha. All rights reserved.
//

import UIKit

class AnswerPost: Post {
    let askingName: String
    let askingUrl: URL
    let question: String
    let answer: String
    
    private enum CodingKeys: String, CodingKey {
        case askingName = "asking_name"
        case askingUrl = "asking_url"
        case question, answer
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.askingName = try container.decode(String.self, forKey: .askingName)
        self.askingUrl = try container.decode(URL.self, forKey: .askingUrl)
        self.question = try container.decode(String.self, forKey: .question)
        self.answer = try container.decode(String.self, forKey: .answer)
        try super.init(from: decoder)
    }
}

