//
//  GrowingButton.swift
//  Excuser
//
//  Created by Paweł Świątek on 25/10/2022.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
