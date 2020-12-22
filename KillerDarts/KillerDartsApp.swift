//
//  KillerDartsApp.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

@main
struct KillerDartsApp: App {
    
    var body: some Scene {
        WindowGroup {
            let playerStore = PlayerStore()
            ContentView()
                .environmentObject(GameStore())
                .environmentObject(playerStore)
                .environmentObject(GameData(playerStore: playerStore))
        }
    }
}
