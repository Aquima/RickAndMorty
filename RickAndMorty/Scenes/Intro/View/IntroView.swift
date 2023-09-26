//
//  IntroView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 25/09/23.
//

import SwiftUI

struct IntroView: View {
    // MARK: - Properties
    @State private var moveOscillationPath = false
    @State private var showingCharacterListView = false

    var body: some View {
        VStack(spacing: 350, content: {
            logo
            VStack(spacing: 20, content: {
                messageText
                enterButton
            })
        })
        .background {
            AssetsIntro.background.swiftUIImage
                .background(.black)
        }
    }

    private var logo: some View {
        AssetsIntro.logo.swiftUIImage
            .resizable()
            .frame(height: 100)
            .padding(.leading, 40)
            .padding(.trailing, 40)
            .rotationEffect(.degrees( moveOscillationPath ? -5 : 5))
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(), {
                    self.moveOscillationPath.toggle()
                })
            }
    }

    private var enterButton: some View {
        Button(action: {
            print("go to Character list")
            self.goCharacterListView()
        }, label: {
            Text(IntroLocalizable.Title.Button.normal)
        })
        .frame(height: 60)
        .padding(.leading, 40)
        .padding(.trailing, 40)
        .buttonStyle(
            FenixButtonStyle()
        )
    }
    
    private func goCharacterListView() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        if let window = windowScene?.windows.first {
            window.rootViewController = UIHostingController(rootView: CharacterListView())
            window.makeKeyAndVisible()
        }
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
