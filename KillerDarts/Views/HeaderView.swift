//
//  HeaderView.swift
//  KillerDarts
//
//  Created by Jake Renshaw on 14/12/2020.
//

import SwiftUI

struct HeaderView: View {
    
    var coordinator: PlayersCoordinator
    
    var body: some View {
        HStack {
            Button("Play") {
                coordinator.play()
            }.padding()
            Spacer()
            Button("Remove All Players") {
                coordinator.removeAll()
            }.padding()
            Button("Add Players +") {
                coordinator.addRow()
            }.padding()
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(coordinator: PlayersCoordinator())
    }
}
