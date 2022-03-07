//
//  SetGame.swift
//  Set
//
//  Created by Vansh Bhatia on 3/4/22.
//

import Foundation

class SetGame {
    var deck = [Card]()

    init() {
        // method to init all the cards in the deck


        for color in Card.Colours.all {
            for symbol in Card.Symbol.all {
                for shading in Card.Shading.all {
                    for number in Card.Number.all {
                        let card = Card(number: number, symbol: symbol, shading: shading, colours: color)
                        deck.append(card)
                    }
                }
            }

        }


//        for i in Card.Colours.all{
//            print(i)
//        }
//        for i in Card.Symbol.all{
//            print(i)
//        }
//        for i in Card.Shading.all{
//            print(i)
//        }
//        for i in Card.Number.all{
//            print(i.rawValue)
//        }
    }
    func evaluate(cards: [Card]) -> Bool {

        var colorArray: [Card.Colours] = []
        var shapeArray: [Card.Symbol] = []
        var numberArray: [Card.Number] = []
        var shadeArray: [Card.Shading] = []


        for card in cards {
            //print("\(card.number) \(card.colours) \(card.shading) \(card.symbol) ")
            // check common color if any
            if(!(colorArray.contains(card.colours))) {
                colorArray.append(card.colours)
            }
            if(!(shapeArray.contains(card.symbol))) {
                shapeArray.append(card.symbol)
            }
            if(!(numberArray.contains(card.number))) {
                numberArray.append(card.number)
            }
            if(!(shadeArray.contains(card.shading))) {
                shadeArray.append(card.shading)
            }

        }
        if(colorArray.count == 1 || colorArray.count == 3) {
            //print("Colors condition satisfied!")
        }
        else {
            return false
        }
        if(shapeArray.count == 1 || shapeArray.count == 3) {
            //print("Shapes condition satisfied!")
        }
        else {
            return false
        }
        if(numberArray.count == 1 || numberArray.count == 3) {
            //print("Number condition satisfied!")
        }
        else {
            return false
        }
        if(shadeArray.count == 1 || shadeArray.count == 3) {
            //print("Shade condition satisfied!")
        }
        else {
            return false
        }


        // best logic is to add all colors/properties into an array and check size, if size is 1 or 3, then it is valid

        return true

    }
}
