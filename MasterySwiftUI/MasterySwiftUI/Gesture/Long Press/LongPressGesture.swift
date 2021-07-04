//
//  LongPressGesture.swift
//  MasterySwiftUI
//
//  Created by Imran on 3/7/21.
//

import SwiftUI

struct LongPressGesture: View {
    @State private var isLoginPress = false
    @State private var isPressed = false
    var body: some View {
        VStack{
            Image(systemName: isLoginPress ? "lock.open.fill" : "lock.fill")
                .font(.system(size: 100))
                .foregroundColor(isLoginPress ? Color.red : Color.green)
                .animation(isLoginPress ? .linear : .default)
                .onLongPressGesture(minimumDuration: 1, maximumDistance: 1) { value in
                    self.isPressed = value
                } perform: {
                    self.isLoginPress.toggle()
                }

        }
    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture()
    }
}
