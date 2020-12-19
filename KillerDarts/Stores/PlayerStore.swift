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
                winner: false
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
    
    func highlightPlayer(player: Player) {
        self.unhighlightPlayers()
        if let index = self.players.firstIndex(of: player) {
            self.players[index].currentPlayer = true
        }
    }
    
    func nextPlayer() -> Player? {
        var player: Player? = nil
        if let playerAfter = self.players.first(
            where: {
                (!$0.currentPlayer && !$0.elimated) &&
                    (self.players.firstIndex(of: $0)! > self.players.firstIndex(of: self.currentPlayer())!)
            }
        ) {
            player = playerAfter
        } else if let previousPlayer = self.players.first(
            where: {
                (!$0.currentPlayer && !$0.elimated) &&
                    (self.players.firstIndex(of: $0)! < self.players.firstIndex(of: self.currentPlayer())!)
            }
        ) {
            player = previousPlayer
        }
        return player
    }
    
    func unhighlightPlayers() {
        self.players.indices.forEach({ self.players[$0].currentPlayer = false })
    }
    
    func currentPlayer() -> Player {
        self.players.first(where: { $0.currentPlayer }) ?? self.players.first!
    }
    
    func updatePlayerName(name: String, player: Player) {
        if let index = self.players.firstIndex(of: player) {
            self.players[index].name = name
        }
    }
    
    func updateKillerNumber(number: Int, player: Player) {
        if let index = self.players.firstIndex(of: player) {
            self.players[index].number = number
        }
    }
    
    func updatePlayerLives(lives: Int, player: Player) {
        if let index = self.players.firstIndex(of: player) {
            self.players[index].lives = lives
        }
    }
    
    func setWinner(player: Player) {
        if let index = self.players.firstIndex(of: player) {
            self.players[index].winner = true
        }
    }
    
    func resetPlayersToDefault() {
        self.highlightPlayer(player: self.players[0])
    }
}
