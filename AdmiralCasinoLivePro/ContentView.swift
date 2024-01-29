//
//  ContentView.swift
//  AdmiralCasinoLivePro
//
//  Created by Artem on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gm: GameLogic
    var body: some View {
        ZStack {
            if gm.isSplash {
                Splash()
                    .environmentObject(gm)
                    .transition(.move(edge: .trailing))
                
            } else  {
                Menu()
                    .environmentObject(gm)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .slide))
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(GameLogic())
}
