//
//  Player.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import Foundation

struct Player: Hashable, Identifiable, Codable {
    var id: String
    var name: String
    var number: Int?
    var lives: Int
    var currentPlayer: Bool
    var killer: Bool {
        self.lives == 6
    }
    var elimated: Bool {
        self.lives == 0
    }
    var winner: Bool
    var wins: Int
}
