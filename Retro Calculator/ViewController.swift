//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Lalit on 2016-01-06.
//  Copyright © 2016 Lalit. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel:UILabel!
    var btnSound:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("btn", ofType:"wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        do{
          try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
        
        
    }
    @IBAction func numberPressed(btn:UIButton)
    {
        btnSound.play()
    }

   


}

