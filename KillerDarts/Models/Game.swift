//
//  Game.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 15/12/2020.
//

import Foundation

enum GameState {
    case PreGame
    case InProgress
}

struct Game {
    var state: GameState
}
