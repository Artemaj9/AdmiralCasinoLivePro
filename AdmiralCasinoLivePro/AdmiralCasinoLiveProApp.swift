//
//  AdmiralCasinoLiveProApp.swift
//

import SwiftUI

@main
struct AdmiralCasinoLiveProApp: App {
    @StateObject var gm = GameLogic()
    var body: some Scene {
        WindowGroup {
            Menu()
                .environmentObject(gm)
        }
    }
}
