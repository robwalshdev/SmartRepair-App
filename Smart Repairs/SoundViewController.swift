//
//  SoundViewController.swift
//  Smart Repairs
//
//  Created by Robert Walsh on 12/9/17.
//  Copyright © 2017 Robert Walsh. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    var bombSoundEffect: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playSound(_ sender: Any) {
        let path = Bundle.main.path(forResource: "despacito_marimba.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
