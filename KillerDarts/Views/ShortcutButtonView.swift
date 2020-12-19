//
//  ShortcutButtonView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 19/12/2020.
//

import SwiftUI

struct ShortcutButtonView: View {
    @State var showingAlert: Bool = false
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Shortcuts")
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Shortcuts"),
                message: Text("Play/Restart Game - p\nNew Player - n\nUndo Last Player - u\nRemove All Players - r\nGo To Next Player - Enter\nShortcuts - s"),
                dismissButton: .default(Text("OK"))
            )
        }
        .padding()
        .keyboardShortcut("s", modifiers: [])
    }
}

struct ShortcutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutButtonView()
    }
}
