//
//  LyricsViewController.swift
//  Lyrics Finder
//
//  Created by Omar Al Raisi on 10/10/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class LyricsViewController: UIViewController{
   
    @IBOutlet weak var lyricsSpot: UITextView!
    
    var lyrics = ""
    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set the lyrics to the lyrics spot
        lyricsSpot.text = lyrics
    }
}
