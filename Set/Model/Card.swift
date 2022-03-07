//
//  Card.swift
//  Set
//
//  Created by Vansh Bhatia on 3/4/22.
//

import Foundation
import UIKit

struct Card {

    let number: Number
    let symbol: Symbol
    let shading: Shading
    let colours: Colours
    var isFaceUp = false
    var isOver = false


    enum Number: Int {
        case one = 1
        case two = 2
        case three = 3
        static var all: [Number] {
            return [.one, .two, .three]
        }
    }

    enum Symbol: String {
        case triangle = "▲"
        case circle = "●"
        case square = "■"

        static var all: [Symbol] {
            return [.triangle, .circle, .square]
        }
    }
    enum Shading {
        case solid
        case striped
        case outlined
        static var all: [Shading] {
            return [.solid, .striped, .outlined]
        }
    }
    enum Colours {
        case red
        case green
        case purple
        static var all: [Colours] {
            return [.red, .green, .purple]
        }
    }
    func getColor() -> UIColor {
        var color: UIColor {
            switch colours {
            case .green: return UIColor.green
            case .purple: return UIColor.purple
            case .red: return UIColor.red

            }
        }
        return color
    }



}
