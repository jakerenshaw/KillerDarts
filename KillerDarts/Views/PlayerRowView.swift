//
//  PlayerRowView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct PlayerRowView: View {
    @State var player: Player
    
    var body: some View {
        HStack {
            TextField("Player Name", text: $player.name).font(.playerRow)
            TextField("Killer Number", value: $player.number, formatter: NumberFormatter()).font(.playerRow)
            HStack {
                Text("Lives: \(player.lives)").font(.playerRow)
                Button("+") {
                    player.lives += 1
                }
                Button("-") {
                    player.lives -= 1
                }
            }
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: Player(name: "", number: nil, lives: 3))
    }
}
