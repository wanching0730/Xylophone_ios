//
//  ViewController.swift
//  Xylophone
//
//  Created by Wan Ching on 03/01/2018.
//  Copyright © 2018 Wan Ching. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    var selectedSoundFileName : String = ""
    let soundArray  = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func notePressed(_ sender: UIButton) {
        
        selectedSoundFileName = soundArray[sender.tag - 1]
        print(selectedSoundFileName)
        playsound()
        
    }
    
    func playsound(){
        
        let soundUrl = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }catch{
            print(error)
        }
        
        audioPlayer.play()
    }
    
}

