//
//  GameState.swift
//  RPS
//
//  Created by Olga on 30.04.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var gameResult: String {
        switch self {
        case .start:
            return "Game Started: choose the sign!"
        case .win:
            return "You Win!"
        case .lose:
            return "You Lose :("
        case .draw:
            return "Draw"
        }
    }
}
