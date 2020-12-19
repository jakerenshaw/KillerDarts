//
//  KillerView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 16/12/2020.
//

import SwiftUI

struct KillerView: View {
    
    @EnvironmentObject var playerStore: PlayerStore
    
    var game: Game
    var player: Player
    
    private var killerText: String {
        if game.state != .InProgress {
            return "Lives: \(player.lives)"
        } else {
            let text = "Killer"
            let textIndex = text.index(text.startIndex, offsetBy: player.lives)
            return "\(text[..<textIndex])"
        }
    }
    
    var body: some View {
        HStack {
            Text(killerText)
                .font(.playerRow)
            Button("+") {
                playerStore.updatePlayerLives(lives: player.lives + 1, player: player)
            }
            .disabled(!(player.lives < 6))
            Button("-") {
                playerStore.updatePlayerLives(lives: player.lives - 1, player: player)
            }
            .disabled(!(player.lives > 0))
        }
    }
}

struct KillerView_Previews: PreviewProvider {
    static var previews: some View {
        KillerView(
            game: Game(
                state: .PreGame
            ),
            player: Player(
                name: "",
                number: nil,
                lives: 3,
                currentPlayer: false,
                winner: false
            )
        )
    }
}
