//
//  FenixButton.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 25/09/23.
//

import SwiftUI

struct FenixButtonStyle: ButtonStyle {

    var textColor: Color
    var backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.custom("GetSchwifty-Regular", size: 30))
            .foregroundColor(configuration.isPressed ? textColor.opacity(0.8) : textColor)
            .padding()
            .background(configuration.isPressed ? backgroundColor.opacity(0.1) : backgroundColor)
            .animation(.easeOut(duration: 1.0), value: configuration.isPressed)
            .clipShape(Capsule())
    }
}
