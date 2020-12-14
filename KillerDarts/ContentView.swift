//
//  ContentView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var coordinator: PlayersCoordinator
    
    var body: some View {
        VStack {
            HeaderView(coordinator: coordinator)
            if coordinator.startGame {
                // play game
            } else {
                List {
                    ForEach(coordinator.players, id: \.self) { player in
                        PlayerRowView(player: player)
                    }.onDelete{( coordinator.onDelete(offsets: $0) )}
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coordinator: PlayersCoordinator())
    }
}
