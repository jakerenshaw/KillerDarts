//
//  ContentView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var gameStore: GameStore
    @EnvironmentObject var playerStore: PlayerStore
    
    var body: some View {
        VStack {
            HeaderView(
                gameStore: gameStore,
                playerStore: playerStore
            )
            List {
                ForEach(playerStore.players.indices, id: \.self) { indices in
                    PlayerRowView(
                        playerStore: playerStore,
                        game: gameStore.game,
                        index: indices
                    )
                }.onDelete{( playerStore.onDelete(offsets: $0) )}
            }
//            if gameCoordinator.game.inProgress {
//                CurrentGameView(currentPlayer: playersCoordinator.currentPlayer())
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
