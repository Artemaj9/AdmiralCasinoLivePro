//
//  Selection.swift
//

import SwiftUI

struct Selection: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gm: GameLogic
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: "CHOOSE YOUR\nSTRATEGY", fontSize: 21)
                
                ScrollView(showsIndicators: false) {
                    ForEach(0..<3) { index in
                        HStack {
                            NavigationLink {
                                ShortDescription(article: 2*index + 1)
                                    .environmentObject(gm)
                            } label: {
                                Image("person\(2 * index + 1)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .simultaneousGesture(TapGesture().onEnded{
                                gm.strategy = 2*index + 1
                            })
                            Color.clear
                                .frame(width: 1)
                            NavigationLink {
                                ShortDescription(article: 2*index + 2)
                                    .environmentObject(gm)
                            } label: {
                                Image("person\(2*index + 2)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .simultaneousGesture(TapGesture().onEnded{
                                gm.strategy = 2*index + 2
                            })
                        }
                        .padding(.bottom, 6)
                    }
                    Color.clear
                        .frame(height: 100)
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
    Selection()
        .environmentObject(GameLogic())
}
