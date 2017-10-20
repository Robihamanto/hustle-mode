//
//  ViewController.swift
//  hustle-mode
//
//
//  Created by Robihamanto on 01/10/17.
//  Copyright © 2017 bcc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var buttonPower: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var labelHustle: UILabel!
    @IBOutlet weak var labelOn: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
    }

    @IBAction func buttonPowerDidTap(_ sender: UIButton) {
        self.cloudHolder.isHidden = false
        self.darkBlueBG.isHidden = true
        self.buttonPower.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 150, width: 375, height: 383)
        }) { (finished) in
            self.labelHustle.isEnabled = false
            self.labelOn.isEnabled = false
        }
    }
}

