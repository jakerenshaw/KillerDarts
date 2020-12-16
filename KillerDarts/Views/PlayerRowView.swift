//
//  PlayerRowView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct PlayerRowView: View {
    
    @EnvironmentObject var playerStore: PlayerStore
    var game: Game
    var index: Int
    
    @State private var playerName: String = ""
    @State private var killerNumber: Int = 0
    
    var body: some View {
        HStack {
            TextField(
                "Player Name",
                text: $playerName,
                onCommit: updatePlayerName
            )
            .font(.playerRow)
            .disabled(game.inProgress)
            TextField(
                "Killer Number",
                value: $killerNumber,
                formatter: NumberFormatter(),
                onCommit: updateKillerNumber
            )
            .font(.playerRow)
            .disabled(game.inProgress)
            KillerView(
                lives: playerStore.players[index].lives,
                game: game,
                index: index
            )
        }
        .conditionalModifier(
            game.inProgress,
            BorderModifier(player: playerStore.players[index])
        )
    }
    
    private func updatePlayerName() {
        playerStore.updatePlayerName(name: $playerName.wrappedValue, index: index)
    }
    
    private func updateKillerNumber() {
        playerStore.updateKillerNumber(number: $killerNumber.wrappedValue, index: index)
    }
}

struct BorderModifier: ViewModifier {

    var player: Player
    
    func body(content: Content) -> some View {
        let width: CGFloat = player.currentPlayer ? 2 : 0
        let borderColor = player.killer ? Color.red : Color.blue
        return content
            .padding()
            .border(borderColor, width: width)
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(
            game: Game(
                inProgress: false
            ),
            index: 0
        )
    }
}
