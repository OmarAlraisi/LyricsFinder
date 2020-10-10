//
//  ViewController.swift
//  Lyrics Finder
//
//  Created by Omar Al Raisi on 10/10/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {
    
    // Link UI elements
    @IBOutlet weak var findLyricsButtonView: UIButton!
    @IBOutlet weak var foundButtonView: UIButton!
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!
    
    // Create a model variable
    var model = Model()
    
    // Create a variable to hold the lyrics
    var lyric:Lyric?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.delegate = self
        
        // Edit findLyricsButtonView corners
        findLyricsButtonView.layer.cornerRadius = 20
        foundButtonView.layer.cornerRadius = 20
    }

    @IBAction func findLyricsButton(_ sender: Any) {
        
        // Set model artist name
        model.artistName = artistNameTextField.text!
        
        // Set model song name
        model.songName = songNameTextField.text!
        
        // Call getLyrics
        DispatchQueue.main.async {
            
            self.model.getLyrics()
        }
        
        // Animate and hide button
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            self.findLyricsButtonView.alpha = 0
            self.foundButtonView.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.foundButtonView.alpha = 1
        }, completion: nil)
            
        
        
    }
    
    func setLyrics(lyrics: Lyric) {
        
        // Set the lyric of the Model class to the lyric of this class
        self.lyric = lyrics
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Let destination be Lyrics View Controller
        let lVC = segue.destination as! LyricsViewController
        
        lVC.lyrics = self.lyric!.lyrics
        
        findLyricsButtonView.alpha = 1
    }
}

