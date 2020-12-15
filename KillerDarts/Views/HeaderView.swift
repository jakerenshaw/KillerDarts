//
//  HeaderView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct HeaderView: View {
    
    var gameStore: GameStore
    var playerStore: PlayerStore
    
    @State var playButtonText = "Play"
    
    var body: some View {
        HStack {
            Button(playButtonText) {
                if !gameStore.game.inProgress,
                   !playerStore.players.isEmpty {
                    self.playButtonText = "Restart Game"
                    playerStore.highlightPlayer()
                    gameStore.startGame()
                } else {
                    self.playButtonText = "Play"
                    playerStore.unhighlightPlayers()
                    gameStore.endGame()
                }
            }.padding()
            if !gameStore.game.inProgress {
                Spacer()
                Button("Remove All Players") {
                    playerStore.removeAll()
                }.padding()
                Button("Add Players +") {
                    playerStore.addRow()
                }.padding()
            }
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            gameStore: GameStore(),
            playerStore: PlayerStore()
        )
    }
}
