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
    var player: Player
    
    let emptyPlayer = Player(id: "", name: "", number: nil, lives: 3, currentPlayer: false, winner: false, wins: 0)
    
    var body: some View {
        HStack {
            TextField(
                "Player Name",
                text: $playerStore.players[index, default: self.emptyPlayer].name
            )
            .font(.playerRow)
            .disabled(game.state == .InProgress)
            TextField(
                "Killer Number",
                value: $playerStore.players[index, default: self.emptyPlayer].number,
                formatter: NumberFormatter()
            )
            .font(.playerRow)
            .disabled(game.state == .InProgress)
            KillerView(
                game: game,
                player: player
            )
        }
        .conditionalModifier(
            game.state == .InProgress,
            BorderModifier(currentPlayer: player.currentPlayer, killer: player.killer)
        )
        .conditionalModifier(
            (game.state == .InProgress && player.elimated),
            VisibilityModifier()
        )
    }
}

extension Binding where
    Value: MutableCollection,
    Value: RangeReplaceableCollection
{
    subscript(
        _ index: Value.Index,
        default defaultValue: Value.Element
    ) -> Binding<Value.Element> {
        Binding<Value.Element> {
            guard index < self.wrappedValue.endIndex else {
                return defaultValue
            }
            return self.wrappedValue[index]
        } set: { newValue in
            
            // It is possible that the index we are updating
            // is beyond the end of our array so we first
            // need to append items to the array to ensure
            // we are within range.
            while index >= self.wrappedValue.endIndex {
                self.wrappedValue.append(defaultValue)
            }
            
            self.wrappedValue[index] = newValue
        }
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

struct VisibilityModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .hidden()
    }
}
