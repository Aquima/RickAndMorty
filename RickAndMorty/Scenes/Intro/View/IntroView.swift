//
//  IntroView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 25/09/23.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        VStack(spacing: 40, content: {
            logo
            messageText
            enterButton
        })
    }

    private var logo: some View {
        AssetsIntro.logo.swiftUIImage
            .resizable()
            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .padding(.leading, 40)
            .padding(.trailing, 40)
    }

    private var enterButton: some View {
        Button(action: {
            print("go to Character list")
        }, label: {
            Text(IntroLocalizable.Title.Button.normal)
        })
        .frame(height: 50)
        .buttonStyle(
            FenixButtonStyle(
                textColor: .white,
                backgroundColor: .black
            )
        )
    }

    private var messageText: some View {
        Text(IntroLocalizable.Message.Text.normal)
            .multilineTextAlignment(.center)
            .padding(.leading, 40)
            .padding(.trailing, 40)
            .fenixTextStyled
    }
}

#Preview {
    IntroView()
}
