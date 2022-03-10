//
//  Extensions.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 22..
//

import SwiftUI

extension Color {
    static let mainRed = Color("ColorRed")
    static let mainBlue = Color("ColorBlue")
    static let mainGreen = Color("ColorGreen")
    
    static let baseColor = Color("ColorBase")
    static let backgroundColor = Color("ColorBackground")
    static let emptyListColor = Color("ColorEmptyList")
    
    static let twitter = Color("TwitterColor")
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
