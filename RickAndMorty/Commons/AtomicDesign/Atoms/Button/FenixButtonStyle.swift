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
            .foregroundColor(configuration.isPressed ? .black.opacity(0.8) : .black)
            .background(configuration.isPressed ? .white.opacity(0.1) : .white)
            .animation(.easeOut(duration: 1.0), value: configuration.isPressed)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
    }
}
