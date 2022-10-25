//
//  Color+Extension.swift
//  Excuser
//
//  Created by Paweł Świątek on 24/10/2022.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
