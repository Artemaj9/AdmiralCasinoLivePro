//
//  Header.swift
//

import SwiftUI

struct Header: View {
    
    @Environment(\.dismiss) var dismiss
    let text: String
    var fontSize: CGFloat = 27
    var size: CGSize
    var isFromGame = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(Img.header)
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: 109)
                .overlay(alignment: .bottom) {
                    Text(text)
                        .font(.custom(CustomFont.black, size: fontSize))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                        .offset()
                }
            
            HStack {
                Spacer()
                if !isFromGame {
                    Button {
                        dismiss()
                    } label: {
                        Image(Img.exit)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                    }
                }
            }
            .padding()
        }
        .frame(width: 395, height: 109)
    }
}

#Preview {
    Header(text: "INFO", size: CGSize(width: 375, height: 812))
}
