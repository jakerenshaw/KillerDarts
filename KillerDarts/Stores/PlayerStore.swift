//
//  PlayerStore.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 15/12/2020.
//

import Foundation

class PlayerStore: ObservableObject {
    @Published var players: [Player] = []
    
    func addPlayer() {
        self.players.append(
            Player(
                name: "",
                number: nil,
                lives: 3,
                currentPlayer: false,
                killer: false
            )
        )
    }
    
    func onDelete(offsets: IndexSet) {
        self.players.remove(atOffsets: offsets)
    }
    
    func removeAll() {
        self.players.removeAll()
    }
    
    func removeLastPlayer() {
        if !players.isEmpty {
            self.players.removeLast()
        }
    }
    
    func highlightFirstPlayer() {
        self.players[0].currentPlayer = true
    }
    
    func unhighlightPlayers() {
        self.players.indices.forEach({ self.players[$0].currentPlayer = false })
    }
    
    func currentPlayer() -> Player {
        self.players.first(where: { $0.currentPlayer })!
    }
    
    func updatePlayerName(name: String, index: Int) {
        self.players[index].name = name
    }
    
    func updateKillerNumber(number: Int, index: Int) {
        self.players[index].number = number
    }
    
    func updatePlayerLives(lives: Int, index: Int) {
        self.players[index].lives = lives
    }
    
    func togglePlayerKiller(index: Int) {
        self.players[index].killer = (self.players[index].lives == 6)
    }
}
