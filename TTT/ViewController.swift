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
    var tie: Bool?
    var buttonColor = UIColor(white: 0.70, alpha: 1.0)
    
    //    Gameboard array to check against win conditions
    var gameboard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
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
            gameboard[sender.tag] = 1
            turn = "blue"
        }
        else if turn == "blue" {
            buttonColor = UIColor.blue
            gameboard[sender.tag] = -1
            turn = "red"
        }
        sender.backgroundColor = buttonColor
        winner()
    }
    
    func winner() {
        if
            gameboard[0] + gameboard[1] + gameboard[2] == 3 ||
            gameboard[3] + gameboard[4] + gameboard[5] == 3 ||
            gameboard[6] + gameboard[7] + gameboard[8] == 3 ||
            gameboard[0] + gameboard[3] + gameboard[6] == 3 ||
            gameboard[1] + gameboard[4] + gameboard[7] == 3 ||
            gameboard[2] + gameboard[5] + gameboard[8] == 3 ||
            gameboard[0] + gameboard[4] + gameboard[8] == 3 ||
            gameboard[2] + gameboard[4] + gameboard[6] == 3 {
                winnerLabel.text = "Congrats Red Won!"
                winnerLabel.backgroundColor = UIColor.red
                winnerLabel.isHidden = false
        } else if
            gameboard[0] + gameboard[1] + gameboard[2] == -3 ||
            gameboard[0] + gameboard[1] + gameboard[2] == -3 ||
            gameboard[3] + gameboard[4] + gameboard[5] == -3 ||
            gameboard[6] + gameboard[7] + gameboard[8] == -3 ||
            gameboard[0] + gameboard[3] + gameboard[6] == -3 ||
            gameboard[1] + gameboard[4] + gameboard[7] == -3 ||
            gameboard[2] + gameboard[5] + gameboard[8] == -3 ||
            gameboard[0] + gameboard[4] + gameboard[8] == -3 ||
            gameboard[2] + gameboard[4] + gameboard[6] == -3 {
                winnerLabel.text = "Congrats Blue Won!"
                winnerLabel.backgroundColor = UIColor.blue
                winnerLabel.isHidden = false
        } else {
            for i in 0...8 {
                if gameboard[i] == 0 {
                    tie = false
                    break
                }
                else {
                    tie = true
                }
            }
            
            if tie == true {
                winnerLabel.text = "Stick to Rock, Paper, Scissors"
                winnerLabel.backgroundColor = UIColor.orange
                winnerLabel.isHidden = false
            }
        }
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
        
        gameboard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        winnerLabel.isHidden = true
    }
}



