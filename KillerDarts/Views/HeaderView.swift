//
//  HeaderView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var gameStore: GameStore
    @EnvironmentObject var playerStore: PlayerStore
    
    var body: some View {
        HStack {
            PlayNowButtonView()
            ShortcutButtonView()
            if gameStore.game.state != .InProgress {
                LoadGameButtonView()
                LeaderboardView()
                Button("Undo Last Player") {
                    playerStore.removeLastPlayer()
                }
                .padding()
                .keyboardShortcut("u", modifiers: [])
                Button("Remove All Players") {
                    playerStore.removeAll()
                }
                .padding()
                .keyboardShortcut("r", modifiers: [])
                Button("New Player") {
                    playerStore.addPlayer()
                }
                .padding()
                .keyboardShortcut("n", modifiers: [])
            }
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
