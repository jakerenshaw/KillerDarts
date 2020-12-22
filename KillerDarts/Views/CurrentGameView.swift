//
//  CurrentGameView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 15/12/2020.
//

import SwiftUI

struct CurrentGameView: View {
    
    @EnvironmentObject var playerStore: PlayerStore
    @EnvironmentObject var gameData: GameData
    
    var body: some View {
        HStack {
            if self.playerStore.currentPlayer().winner {
                Text("\(playerStore.currentPlayer().name) Wins")
                    .font(.playerRow)
                .onAppear {
                    self.gameData.saveData()
                }
            } else {
                Text("\(playerStore.currentPlayer().name)'s Turn")
                    .font(.playerRow)
                Spacer()
                Button("Next Player") {
                    if let nextPlayer = self.playerStore.nextPlayer() {
                        self.playerStore.highlightPlayer(player: nextPlayer)
                    } else {
                        self.playerStore.setWinner(player: self.playerStore.currentPlayer())
                    }
                }
                .keyboardShortcut(.return, modifiers: [])
            }
        }
        .padding()
        .padding()
    }
}

struct CurrentGameView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentGameView()
    }
}
