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
    var player: Player
    
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
                game: game,
                player: player
            )
        }
        .conditionalModifier(
            game.inProgress,
            BorderModifier(currentPlayer: player.currentPlayer, killer: player.killer)
        )
    }
    
    private func updatePlayerName() {
        playerStore.updatePlayerName(name: $playerName.wrappedValue, player: player)
    }
    
    private func updateKillerNumber() {
        playerStore.updateKillerNumber(number: $killerNumber.wrappedValue, player: player)
    }
}

struct BorderModifier: ViewModifier {

    var currentPlayer: Bool
    var killer: Bool
    
    func body(content: Content) -> some View {
        let width: CGFloat = currentPlayer ? 2 : 0
        let borderColor = killer ? Color.red : Color.blue
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
            player: Player(
                name: "",
                number: nil,
                lives: 3,
                currentPlayer: false
            )
        )
    }
}
