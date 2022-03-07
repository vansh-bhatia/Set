//
//  ViewController.swift
//  Set
//
//  Created by Vansh Bhatia on 3/4/22.
//

import UIKit

class ViewController: UIViewController {

    var game = SetGame()
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    @IBOutlet weak var scoreLabel: UILabel!

    var dict: [UIButton: Card] = [:]

    var activeCards: [UIButton] = []//can have 1,2,3 items


    @IBOutlet var cardButtons: [UIButton]! {
        didSet {


            for button in cardButtons {

                let randIndex = Int(arc4random_uniform(UInt32(game.deck.count)))

                dict[button] = game.deck[randIndex]


                var color = dict[button]!.getColor()
                let number = dict[button]!.number.rawValue
                let text = dict[button]!.symbol.rawValue
                var newText = ""

                var width = 5
                if(dict[button]!.shading == .striped) {
                    color = color.withAlphaComponent(0.35)
                }
                else if(game.deck[randIndex].shading == .solid) {
                    width = 9
                    width = -width
                }
                else {
                    width = 9
                }

                for _ in 1...number {
                    newText.append(text)
                }


                let attributes: [NSAttributedString.Key: Any] = [

                        .strokeColor: color,
                        .foregroundColor: color,
                        .strokeWidth: width, // negative number here would mean fill (positive means outline)
                    .font: UIFont(name: "System Font Regular", size: 29.5)!


                ]
                let attribtext = NSAttributedString(string: newText

                    , attributes: attributes)

                button.setAttributedTitle(attribtext, for: .normal)

                game.deck.remove(at: randIndex)
            }
        }
    }



    @IBAction func cardButtonPressed(_ sender: UIButton) {
        //print(cardButtons.firstIndex(of: sender) ?? "Error")
        if(dict[sender]?.isFaceUp == true) {
            return
        }
        if(activeCards.contains(sender)) {
            return
        }
        if(sender.layer.borderWidth == 3.0) {
            for card in activeCards {
                card.layer.borderWidth = 0.0
                card.layer.borderColor = .none
            }
            activeCards.removeAll()
            return
        }

        activeCards.append(sender)


        if(activeCards.count == 3) {
            for card in activeCards {
                card.layer.borderWidth = 0.0
                card.layer.borderColor = .none
            }

            //print("Put the eval condition here")
            var cardArray: [Card] = []
            for i in activeCards {
                cardArray.append(dict[i]!)
            }
            if(game.evaluate(cards: cardArray)) {
                print("SET MADE!!")
                for card in activeCards {
                    card.backgroundColor = .black

                    let attributes: [NSAttributedString.Key: Any] = [
                            .font: UIFont(name: "System Font Regular", size: 29.5)!
                    ]
                    let newText = NSAttributedString(string: "✅", attributes: attributes)
                    card.setAttributedTitle(newText, for: .normal)
                    dict[card]?.isOver = true
                    dict[card]?.isFaceUp = true

                }
                score += 1
            }

            activeCards.removeAll()
        }
        else if(activeCards.count < 3) {

            sender.layer.borderWidth = 3.0
            sender.layer.borderColor = UIColor.blue.cgColor
        }





        //print("\(dict[sender]!.number) \(dict[sender]!.colours) \(dict[sender]!.shading) \(dict[sender]!.symbol) ")



    }

    override func viewDidLoad() {
        super.viewDidLoad()

        

    }



}

