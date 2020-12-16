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
            HeaderView()
            List {
                ForEach(playerStore.players.indices, id: \.self) { indices in
                    PlayerRowView(
                        game: gameStore.game,
                        player: playerStore.players[indices]
                    )
                }.onDelete{( playerStore.onDelete(offsets: $0) )}
            }
            if gameStore.game.inProgress {
                CurrentGameView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
