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
    
    enum Operation:String{
        case Divide = "/"
        case Multiply = "*"
        case Addition = "+"
        case Substract = "-"
        case Empty = ""
        
    }
    var result = ""
    var runningNumber = ""
    var leftVar = ""
    var rightVar = ""
    var currentOperation : Operation = Operation.Empty
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
       playSound()
        runningNumber += "\(btn.tag)"
        outputLabel.text = runningNumber
    }

   
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }

    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Substract)
    }
    
    
   
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Addition)
        
    }
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op:Operation)
    {
        playSound()
        if currentOperation != Operation.Empty
        {
           
            //A user selected an operator then selected another number without
            //first entering a number
            if runningNumber != ""{
                rightVar = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply
                {
                    result = "\(Double(leftVar)! * Double(rightVar)!)"
                }
                else if currentOperation == Operation.Divide
                {
                    result = "\(Double(leftVar)! / Double(rightVar)!)"
                }
                else if currentOperation == Operation.Addition
                {
                    result = "\(Double(leftVar)! + Double(rightVar)!)"
                }
                else if currentOperation == Operation.Substract
                {
                    result = "\(Double(leftVar)! - Double(rightVar)!)"
                }
                leftVar = result
                outputLabel.text = result
            }
            currentOperation = op
        }
        else
        {
            //This is the first operator has been pressed
            leftVar = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound(){
        if btnSound.playing{
            btnSound.stop()
        }
        btnSound.play()
    }
}

