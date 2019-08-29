//
//  ViewController.swift
//  Xylophone

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var noteArray = ["note1","note2", "note3", "note4", "note5", "note6", "note7"]
    var player = AVAudioPlayer()
    var selectedSoundFile: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        playSound(soundFile: noteArray[sender.tag - 1])
    }
    
    func playSound(soundFile: String){
        let path = Bundle.main.path(forResource: soundFile, ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            sound.prepareToPlay()
            sound.play()
        } catch {
            print("error loading file")
        }
    }
}

