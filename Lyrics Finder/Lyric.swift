//
//  Lyric.swift
//  Lyrics Finder
//
//  Created by Omar Al Raisi on 10/10/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Lyric : Decodable {
    
    var lyrics = ""
    
    enum CodingKeys: String, CodingKey {
        case lyrics
    }
    
    init(from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse lyrics
        self.lyrics = try container.decode(String.self, forKey: .lyrics)
    }
}
