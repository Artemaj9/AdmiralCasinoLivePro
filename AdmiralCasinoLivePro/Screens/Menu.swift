//
//  Menu.swift
//

import SwiftUI

struct Menu: View {
    @State var size: CGSize = .zero
    
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                    .background {
                        GeometryReader { geo in
                            Color.clear.onAppear {
                                size = geo.size
                            }
                        }
                    }
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hello!")
                                .font(.custom(CustomFont.extraBold, size: 33))
                            
                            Text("Ready For New Startegies?")
                                .font(.custom(CustomFont.extraBold, size: 18))
                        }
                        .foregroundStyle(.white)
                        .padding(.top)
                        
                        Spacer()
                        
                        NavigationLink {
                            Info()
                        } label: {
                            Image(Img.info)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                    }
                    .padding([.horizontal, .top], 18)
                    
                    Image(Img.menulogo)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                        .overlay(alignment: .bottom) {
                            Image(Img.play)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 72, height: 72)
                                .offset(y: 16)
                        }
                    
                    HStack {
                        Text("Knowledge Base")
                            .font(.custom(CustomFont.extraBold, size: 21))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding([.horizontal], 18)
                    .padding(.top)
                    
                    HStack {
                        NavigationLink {
                            History()
                        } label: {
                            Image(Img.history)
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.width*0.42, height: size.height * 0.3)
                                .padding(.trailing)
                        }

                   
                        NavigationLink {
                            Strategies()
                        } label: {
                            Image(Img.strategies)
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.width*0.42, height: size.height*0.3)
                        }
                    }
                    .padding(18)
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(historyReflection)
                            .frame(width: size.width*0.42, height: size.height*0.07)
                            .opacity(0.3)
                            .padding(.trailing)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(stratReflection)
                            .frame(width: size.width*0.42, height: size.height*0.07)
                            .opacity(0.2)
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
}

#Preview {
    Menu()
}
