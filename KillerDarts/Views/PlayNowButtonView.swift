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
            if gameStore.game.state != GameState.InProgress,
               playerStore.players.count > 1 {
                self.playButtonText = "Restart Game"
                self.playerStore.resetPlayersToDefault()
                gameStore.startGame()
            } else {
                self.playButtonText = "Play"
                playerStore.unhighlightPlayers()
                gameStore.endGame()
            }
        }
        .padding()
        .keyboardShortcut("p", modifiers: [])
    }
}

struct PlayNowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayNowButtonView()
    }
}
