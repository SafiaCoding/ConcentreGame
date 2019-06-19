//
//  ViewController.swift
//  ConcentreGame
//
//  Created by SafiaCHMITI on 19/06/2019.
//  Copyright © 2019 SafiaCHMITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var turnCount: Int = 0 {
        didSet {
            countLabel.text = "CardClicks: \(turnCount)"
        }
    }
    
    var cardContent: [String] = ["😇", "🙌🏻","😇","🙌🏻"]
    
    @IBAction func clickCard(_ sender: UIButton) {
        turnCount += 1
        
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            turnCard(emoji: cardContent[cardIndex], button: sender)
        } else {
            print("error in choising cards")
        }
            
    }

    func turnCard(emoji: String, button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

