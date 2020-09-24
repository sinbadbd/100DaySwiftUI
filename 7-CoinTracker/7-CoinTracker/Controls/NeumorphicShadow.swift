//
//  NeumorphicShadow.swift
//  7-CoinTracker
//
//  Created by Imran on 23/9/20.
//

import SwiftUI
struct NeumorphicShadow: ViewModifier{
    func body (content:Content) -> some View {
        content
            .shadow(color: Color.greenish.opacity(0.1), radius: 5, x: -5, y: -5)
            .shadow(color: Color.drakShadow.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}

extension View {
    func neumorphicsShadow() -> some View {
        return self.modifier(NeumorphicShadow())
    }
}
