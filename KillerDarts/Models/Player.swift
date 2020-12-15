//
//  Player.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import Foundation

struct Player: Hashable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var number: Int?
    var lives: Int
    var currentPlayer: Bool
    var killer: Bool
}
