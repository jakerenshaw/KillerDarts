//
//  CurrentGameView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 15/12/2020.
//

import SwiftUI

struct CurrentGameView: View {
    
    @EnvironmentObject var playerStore: PlayerStore
    
    var body: some View {
        HStack {
            Text("\(playerStore.currentPlayer().name)'s Turn")
                .font(.playerRow)
            Button("Next Player") {
                playerStore.highlightNextPlayer()
            }
        }
    }
}

struct CurrentGameView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentGameView()
    }
}
