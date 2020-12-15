//
//  GameStore.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 15/12/2020.
//

import Foundation

final class GameStore: ObservableObject {
    @Published var game = Game(inProgress: false)
    
    func startGame() {
        self.game.inProgress = true
    }
    
    func endGame() {
        self.game.inProgress = false
    }
}
