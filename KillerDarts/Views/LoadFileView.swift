//
//  LoadFileView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 22/12/2020.
//

import SwiftUI

struct LoadFileView: View {
    let title: String
    let fileNames: [String]
    @Binding var isPresented: Bool
    var completion: ((String) -> Void)

    var body: some View {
        VStack {
            Text("Load Game")
            Divider()
            Spacer()
            Spacer()
            ForEach(fileNames, id: \.self) { name in
                Spacer()
                Button(name) {
                    completion(name)
                    self.isPresented = false
                }
            }
            Spacer()
            Spacer()
            Spacer()
            Button("Dismiss") {
                self.isPresented = false
            }
        }
        .padding()
    }
}
