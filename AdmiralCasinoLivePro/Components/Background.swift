//
//  BackgroundView.swift
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Image(Img.bg).resizable()
                .scaledToFill()
                .scaleEffect(1.01)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Background()
}
