//
//  ViewController.swift
//  TTT
//
//  Created by Matthew on 1/15/18.
//  Copyright © 2018 Matthew Burnside. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: Properties
    @IBOutlet var winnerLabel: UILabel!
    
    //    Top Row
    @IBOutlet var buttonTopLeft: UIButton!
    @IBOutlet var buttonTopCenter: UIButton!
    @IBOutlet var buttonTopRight: UIButton!
    //    Center Row
    @IBOutlet var buttonCenterLeft: UIButton!
    @IBOutlet var buttonCenterCenter: UIButton!
    @IBOutlet var buttonCenterRight: UIButton!
    //    Bottom Row
    @IBOutlet var buttonBottomLeft: UIButton!
    @IBOutlet var buttonBottomCenter: UIButton!
    @IBOutlet var buttonBottomRight: UIButton!
    //    Initial player turn, tie condition, and square color
    var turn: String = "red"
    var buttonColor = UIColor(white: 0.70, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //    MARK: Actions
    @IBAction func changeButtonColor(_ sender: UIButton) {
        if  sender.backgroundColor == UIColor.red || sender.backgroundColor == UIColor.blue {
            return
        }
        
        if turn == "red" {
            buttonColor = UIColor.red
            turn = "blue"
        }
        else if turn == "blue" {
            buttonColor = UIColor.blue
            turn = "red"
        }
        sender.backgroundColor = buttonColor
//        winner() - Write winning conditions fuction
    }
    
    @IBAction func reset(_ sender: Any) {
        buttonColor = UIColor(white: 0.70, alpha: 1.0)
        buttonTopLeft.backgroundColor = buttonColor
        buttonTopCenter.backgroundColor = buttonColor
        buttonTopRight.backgroundColor = buttonColor
        buttonCenterLeft.backgroundColor = buttonColor
        buttonCenterCenter.backgroundColor = buttonColor
        buttonCenterRight.backgroundColor = buttonColor
        buttonBottomLeft.backgroundColor = buttonColor
        buttonBottomCenter.backgroundColor = buttonColor
        buttonBottomRight.backgroundColor = buttonColor
        
        winnerLabel.isHidden = true
    }
    
}
