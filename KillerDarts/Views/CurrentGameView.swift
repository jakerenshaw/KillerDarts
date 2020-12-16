//
//  CurrentGameView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 15/12/2020.
//

import SwiftUI

struct CurrentGameView: View {
    
    var currentPlayer: Player
    
    var body: some View {
        HStack {
            Text("\(currentPlayer.name)'s Turn")
                .font(.playerRow)
            Button("Next Player") {
                //highlight next player
            }
        }
    }
}

struct CurrentGameView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentGameView(
            currentPlayer: Player(
                name: "",
                number: nil,
                lives: 3,
                currentPlayer: false,
                killer: false
            )
        )
    }
}
