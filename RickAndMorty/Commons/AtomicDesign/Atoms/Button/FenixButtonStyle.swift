//
//  FenixButton.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 25/09/23.
//

import SwiftUI

struct FenixButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.custom("GetSchwifty-Regular", size: 30))
            .foregroundColor(configuration.isPressed ? .white.opacity(0.5) : .white)
            .animation(.easeOut(duration: 1.0), value: configuration.isPressed)
    }
}
