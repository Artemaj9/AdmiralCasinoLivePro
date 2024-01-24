//
//  Header.swift
//

import SwiftUI

struct Header: View {
    
    @Environment(\.dismiss) var dismiss
    let text: String
    var fontSize: CGFloat = 27
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(Img.header)
                .resizable()
                .scaledToFill()
                .frame(width: 394, height: 109)
                .overlay(alignment: .bottom) {
                    Text(text)
                        .font(.custom(CustomFont.black, size: fontSize))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                }
            HStack {
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(Img.exit)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                }
            }
            .padding()
        }
    }
}

#Preview {
    Header(text: "INFO")
}
