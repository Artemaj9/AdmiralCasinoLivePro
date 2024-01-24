//
//  Colors.swift
//

import SwiftUI


enum Pallete {
    static let yellowtxt = "yellowtxt"
    static let timergray = Color("timergray")
    static let sessionShdw = Color("sessionShadow")
    static let income = Color("incomegreen")
    static let outcome = Color("outcomered")
    static let yellowstat = Color("statyellow")
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
