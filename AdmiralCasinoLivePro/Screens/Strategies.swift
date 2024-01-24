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
                
                ScrollView(showsIndicators: false) {
                    ForEach(0..<3) { index in
                        HStack {
                            Image("person\(2 * index + 1)")
                                .resizable()
                                .scaledToFit()
                            Color.clear
                                .frame(width: 1)
                            Image("person\(2*index + 2)")
                                .resizable()
                                .scaledToFit()
                        }
                        .padding(.bottom, 6)
                    }
                }
                .padding(16)
                
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
