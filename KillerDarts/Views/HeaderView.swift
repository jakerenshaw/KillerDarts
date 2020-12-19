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
            if gameStore.game.state != .InProgress {
                Spacer()
                Button("Remove Last Player") {
                    playerStore.removeLastPlayer()
                }
                .padding()
                .keyboardShortcut("u", modifiers: [])
                Button("Remove All Players") {
                    playerStore.removeAll()
                }
                .padding()
                .keyboardShortcut("r", modifiers: [])
                Button("Add Players +") {
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
