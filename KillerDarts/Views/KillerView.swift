//
//  KillerView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 16/12/2020.
//

import SwiftUI

struct KillerView: View {
    
    @State var lives: Int
    @EnvironmentObject var playerStore: PlayerStore
    var game: Game
    var index: Int
    var killerText: String {
        if !game.inProgress {
            return "Lives: \(lives)"
        } else {
            let text = "Killer"
            let textIndex = text.index(text.startIndex, offsetBy: lives)
            return "\(text[..<textIndex])"
        }
    }
    
    var body: some View {
        HStack {
            Text(killerText)
                .font(.playerRow)
            Button("+") {
                lives += 1
                self.updatePlayerLives()
            }
            .disabled(!(lives < 6))
            .keyboardShortcut(.upArrow, modifiers: .command)
            Button("-") {
                lives -= 1
                self.updatePlayerLives()
            }
            .disabled(!(lives > 0))
            .keyboardShortcut(.downArrow, modifiers: .command)
        }
    }
    
    private func updatePlayerLives() {
        playerStore.updatePlayerLives(lives: $lives.wrappedValue, index: index)
        playerStore.togglePlayerKiller(index: index)
    }
}

struct KillerView_Previews: PreviewProvider {
    static var previews: some View {
        KillerView(
            lives: 3,
            game: Game(
                inProgress: false
            ),
            index: 0
        )
    }
}
