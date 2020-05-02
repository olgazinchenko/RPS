//
//  Sign.swift
//  RPS
//
//  Created by Olga on 30.04.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import Foundation
import GameplayKit

func randomSign() -> Sign {
    let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors, none
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        case .none:
            return ""
        }
    }
    
    func gameStateDetermination(computerSign: Sign) -> GameState {
        var gameState: GameState = GameState.start
        if self == computerSign {
            gameState = GameState.draw
        } else if self == .paper && computerSign == .rock {
            gameState = GameState.win
        } else if self == .rock && computerSign == .scissors {
            gameState = GameState.win
        } else if self == .scissors && computerSign == .paper {
            gameState = GameState.win
        } else {
            gameState = GameState.lose
        }
        return gameState
    }
}
