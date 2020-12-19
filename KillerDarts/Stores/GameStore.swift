//
//  GameStore.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 15/12/2020.
//

import Foundation

final class GameStore: ObservableObject {
    @Published var game = Game(state: .PreGame)
    
    func startGame() {
        self.game.state = .InProgress
    }
    
    func endGame() {
        self.game.state = .PreGame
    }
}
