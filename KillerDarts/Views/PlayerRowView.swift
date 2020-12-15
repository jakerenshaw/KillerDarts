//
//  PlayerRowView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct PlayerRowView: View {
    
    var playerStore: PlayerStore
    var game: Game
    var index: Int
    
    @State private var playerName: String = ""
    @State private var killerNumber: Int = 0
    @State private var lives: Int = 3
    
    var body: some View {
        HStack {
            TextField("Player Name", text: $playerName, onCommit: updatePlayerName).font(.playerRow)
            TextField("Killer Number", value: $killerNumber, formatter: NumberFormatter(), onCommit: updateKillerNumber).font(.playerRow)
            HStack {
                Text("Lives: \(lives)").font(.playerRow)
                Button("+") {
                    lives += 1
                    self.updatePlayerLives()
                }
                Button("-") {
                    lives -= 1
                    self.updatePlayerLives()
                }
            }
        }
        .conditionalModifier(
            game.inProgress,
            BorderModifier(player: playerStore.players[index])
        )
    }
    
    private func updatePlayerName() {
        playerStore.players[index].name = $playerName.wrappedValue
    }
    
    private func updateKillerNumber() {
        playerStore.players[index].number = $killerNumber.wrappedValue
    }
    
    private func updatePlayerLives() {
        playerStore.players[index].lives = $lives.wrappedValue
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
            playerStore: PlayerStore(),
            game: Game(
                inProgress: false
            ),
            index: 0
        )
    }
}
