//
//  Strategies.swift
//

import SwiftUI

struct Strategies: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: "STRATEGIES")
                
                ScrollView {
                    ForEach(0..<3) { index in
                        HStack {
                            Image("person\(2 * index + 1)")
                                .resizable()
                                .scaledToFit()
                            Image("person\(2*index + 2)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .padding(8)
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    Strategies()
}
