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
            ContentView(coordinator: PlayersCoordinator())
        }
    }
}
