//
//  LoadGameButtonView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 22/12/2020.
//

import SwiftUI

struct LoadGameButtonView: View {
    @State private var isShowingAlert = false
    @EnvironmentObject var gameData: GameData
    
    var body: some View {
        var fileNames = [String]()
        Spacer()
        Button("Load Game") {
            self.gameData.loadFileNames { (files) in
                guard let files = files else {
                    return
                }
                fileNames = files
                self.isShowingAlert = true
            }
        }
        .sheet(isPresented: $isShowingAlert) {
            LoadFileView(title: "Test", fileNames: fileNames, isPresented: $isShowingAlert) { fileName in
                self.gameData.loadFile(gameName: fileName)
            }
        }
        .padding()
        .keyboardShortcut("l", modifiers: [])
    }
}

struct LoadGameButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoadGameButtonView()
    }
}
