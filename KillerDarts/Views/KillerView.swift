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
        if !game.inProgress {
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
            .keyboardShortcut(.upArrow, modifiers: .command)
            Button("-") {
                playerStore.updatePlayerLives(lives: player.lives - 1, player: player)
            }
            .disabled(!(player.lives > 0))
            .keyboardShortcut(.downArrow, modifiers: .command)
        }
    }
}

struct KillerView_Previews: PreviewProvider {
    static var previews: some View {
        KillerView(
            game: Game(
                inProgress: false
            ),
            player: Player(
                name: "",
                number: nil,
                lives: 3,
                currentPlayer: false
            )
        )
    }
}
