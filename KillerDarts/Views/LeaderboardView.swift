//
//  LeaderboardView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 22/12/2020.
//

import SwiftUI

struct LeaderboardView: View {
    @State var showingAlert: Bool = false
    @EnvironmentObject var playerStore: PlayerStore
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Rankings")
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Rankings"),
                message: Text(self.playerStore.rankings()),
                dismissButton: .default(Text("OK"))
            )
        }
        .padding()
        .keyboardShortcut("r", modifiers: [])
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
