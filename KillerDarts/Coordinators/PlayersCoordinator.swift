//
//  PlayersCoordinator.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

class PlayersCoordinator: ObservableObject {
    @Published var players: [Player] = []
    @Published var startGame = false
    
    func addRow() {
        self.players.append(Player(name: "", number: nil, lives: 3))
    }
    
    func onDelete(offsets: IndexSet) {
        players.remove(atOffsets: offsets)
    }
    
    func removeAll() {
        players.removeAll()
    }
    
    func play() {
        startGame.toggle()
    }
}
