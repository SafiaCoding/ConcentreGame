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

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var turnCount: Int = 0 {
        didSet {
            countLabel.text = "CardClicks: \(turnCount)"
        }
    }
    
    var cardContent: [String] = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    var emoji = [Int: String]()
    
    @IBAction func clickCard(_ sender: UIButton) {
        turnCount += 1
        
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        } else {
            print("error in choising cards")
        }
            
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
               button.backgroundColor = UIColor.white
                
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, cardContent.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(cardContent.count - 1)))
            emoji[card.identifier] = cardContent.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
}

