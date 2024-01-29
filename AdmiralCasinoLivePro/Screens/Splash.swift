//
//  SplashViw.swift
//

import SwiftUI

struct Splash: View {
    @EnvironmentObject var gm: GameLogic
    @State var opacity: CGFloat = 1
    @State var offsetX: CGFloat = -500
   
    var body: some View {
        ZStack {
            Background()
                .background() {
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                gm.size = geo.size
                                print("Width: \(gm.size.width)")
                                print("Height: \(gm.size.height)")
                            }
                    }
                }
            VStack {
                Image(Img.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: gm.size.width * 0.5)
                    .padding(.bottom, 30)
                 
                Image(Img.splashTitle)
                    .resizable()
                    .scaledToFit()
                    .frame(width: gm.size.width * 0.5)
            }
            .offset(x: offsetX)
            .animation(.spring(), value: offsetX)
        }
        .onAppear {
            offsetX = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                withAnimation {
                    self.gm.isSplash = false
                }
            }
        }
    }
}

#Preview {
    Splash()
        .environmentObject(GameLogic())
}
