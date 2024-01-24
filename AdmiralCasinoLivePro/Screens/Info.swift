//
//  Info.swift
//

import SwiftUI

struct Info: View {
    
    @Environment(\.dismiss) var dismiss
    @State var screen = 1
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: "INFO")
                
                Image("infoimg\(screen)")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    // title
                    Text(infoScreens[screen - 1].title)
                        .font(.custom(CustomFont.black, size: 24))
                        .padding(.bottom, 8)
                        .foregroundStyle(.yellowtxt)
                   
                    Text(infoScreens[screen - 1].description)
                        .font(.custom(CustomFont.medium, size: 18))
                        .foregroundStyle(.white)
                }
                .padding()
                
                if screen == 1 {
                    Button {
                        screen += 1
                    } label: {
                        Image(Img.nextlong)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }

                 
                } else {
                    HStack {
                        Button {
                            if screen > 1 {
                               screen -= 1
                            }
                        } label: {
                            Image(Img.backbtn)
                                .resizable()
                                .scaledToFit()
                        }
                        .padding()
                     
                    
                        Button {
                            if screen < 5 {
                                screen += 1
                            } else {
                                dismiss()
                            }
                        } label: {
                            Image(Img.nextbtn)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding()
                }
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    Info()
}