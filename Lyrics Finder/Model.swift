//
//  Model.swift
//  Lyrics Finder
//
//  Created by Omar Al Raisi on 10/10/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

// Create a protocol
protocol ModelDelegate {
    func setLyrics(lyrics: Lyric)
}

class Model {
    
    var delegate:ModelDelegate?
    
    var artistName = ""
    var songName = ""
    
    func getLyrics () {
        
        // Substitute whitespace with %20 of both artist and song names
        artistName = artistName.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        songName = songName.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        
        // Create full URLString
        let urlString = Constants.API_URL + artistName + "/" + songName
        
        // Create URL
        let url = URL(string: urlString)
        
        // Validate it
        guard url != nil else {
            return
        }
        
        // Create URLSession
        let session = URLSession.shared
        
        // Create data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check for errors and data
            guard error == nil && data != nil else {
                return
            }
            
            // Decode the JSON
            do {
                
                // Create a JSONDecoder
                let decoder = JSONDecoder()
                
                // Create a variable to hold the lyrics
                let lyric = try decoder.decode(Lyric.self, from: data!)
                DispatchQueue.main.async {
                    
                    self.delegate?.setLyrics(lyrics: lyric)
                }
            } catch {
                return
            }
        }
        
        // Resume data task
        dataTask.resume()
    }
}
