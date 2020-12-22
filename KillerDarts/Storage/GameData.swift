//
//  GameData.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 22/12/2020.
//

import Foundation
import SwiftUI

class GameData: ObservableObject {
    
    let playerStore: PlayerStore
    var documentsDirectory: URL = {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }()
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    init(playerStore: PlayerStore) {
        self.playerStore = playerStore
    }
    
    func loadFileNames(completion: (([String]?) -> Void)) {
        let fileNames = try? FileManager.default.contentsOfDirectory(atPath: documentsDirectory.path) as [String]
        completion(fileNames?.filter({ $0 != ".DS_Store" }))
    }
    
    func loadFile(gameName: String) {
        if let data = FileManager.default.contents(atPath: documentsDirectory.appendingPathComponent(gameName).path) {
            do {
                let players = try decoder.decode([Player].self, from: data)
                self.playerStore.loadPlayers(loadedPlayers: players)
            } catch {
                print(error)
            }
        }
    }
    
    func saveData() {
        var path = ""
        self.playerStore.players.forEach({ path.append("\($0.name)-") })
        path.removeLast()
        let pathWithFileName = documentsDirectory.appendingPathComponent(path)
        do {
            let playersData = self.playerStore.players.compactMap({
                Player(
                    id: $0.id,
                    name: $0.name,
                    number: nil,
                    lives: 3,
                    currentPlayer: false,
                    winner: false,
                    wins: $0.wins
                )
            })
            let data = try encoder.encode(playersData)
            try data.write(to: pathWithFileName)
        } catch {
            print(error)
        }
    }
}
