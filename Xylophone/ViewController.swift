//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else {
            print("Could not find the sound needed")
            return
        }

        do {
            // make the sound play when the phone is on silent or when the phone has been blocked
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            if let player = player {
                player.play()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func keyPressed(_ button: UIButton) {
        if let note = button.currentTitle {
            playSound(note: note);
        }
    }
    
    
    

}

