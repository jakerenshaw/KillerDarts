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
            if !gameStore.game.inProgress {
                Spacer()
                Button("Remove Last Player") {
                    playerStore.removeLastPlayer()
                }
                .padding()
                .keyboardShortcut("u", modifiers: .control)
                Button("Remove All Players") {
                    playerStore.removeAll()
                }
                .padding()
                .keyboardShortcut("r", modifiers: .control)
                Button("Add Players +") {
                    playerStore.addPlayer()
                }
                .padding()
                .keyboardShortcut("n", modifiers: .control)
            }
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
