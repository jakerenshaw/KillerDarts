//
//  PlayNowButtonView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 16/12/2020.
//

import SwiftUI

struct PlayNowButtonView: View {
    
    @State private var playButtonText = "Play"
    @EnvironmentObject var gameStore: GameStore
    @EnvironmentObject var playerStore: PlayerStore
    
    var body: some View {
        Button(playButtonText) {
            if !gameStore.game.inProgress,
               !playerStore.players.isEmpty {
                self.playButtonText = "Restart Game"
                playerStore.highlightFirstPlayer()
                gameStore.startGame()
            } else {
                self.playButtonText = "Play"
                playerStore.unhighlightPlayers()
                gameStore.endGame()
            }
        }
        .padding()
        .keyboardShortcut("p", modifiers: .control)
    }
}

struct PlayNowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayNowButtonView()
    }
}
