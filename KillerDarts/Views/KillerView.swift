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
    var index: Int
    
    private var killerText: String {
        if !game.inProgress {
            return "Lives: \(playerStore.players[index].lives)"
        } else {
            let text = "Killer"
            let textIndex = text.index(text.startIndex, offsetBy: playerStore.players[index].lives)
            return "\(text[..<textIndex])"
        }
    }
    
    var body: some View {
        HStack {
            Text(killerText)
                .font(.playerRow)
            Button("+") {
                playerStore.updatePlayerLives(lives: playerStore.players[index].lives + 1, index: index)
            }
            .disabled(!(playerStore.players[index].lives < 6))
            .keyboardShortcut(.upArrow, modifiers: .command)
            Button("-") {
                playerStore.updatePlayerLives(lives: playerStore.players[index].lives - 1, index: index)
            }
            .disabled(!(playerStore.players[index].lives > 0))
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
            index: 0
        )
    }
}
