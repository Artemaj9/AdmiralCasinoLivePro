//
//  Colors.swift
//

import SwiftUI


enum Pallete {
    static let yellowtxt = "yellowtxt"
}


let historyReflection  = LinearGradient(
    colors: [
        Color("historygrad"),
        Color("historygrad").opacity(0)
    ],
    startPoint: .top,
    endPoint: .bottom
)

let stratReflection  = LinearGradient(
    colors: [
        Color("stratgrad"),
        Color("stratgrad").opacity(0)
    ],
    startPoint: .top,
    endPoint: .bottom
)
