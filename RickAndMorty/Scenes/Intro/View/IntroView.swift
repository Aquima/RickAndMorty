//
//  IntroView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 25/09/23.
//

import SwiftUI

struct IntroView: View {

    // MARK: - ObservedObject Properties
    @ObservedObject private var viewModel: IntroViewModel

    init() {
        _viewModel = ObservedObject(wrappedValue: IntroViewModel())
    }

    var body: some View {
        VStack(spacing: 350, content: {
            logo
            VStack(spacing: 20, content: {
                messageText
                enterButton
            })
            .fullScreenCover(isPresented: $viewModel.showingCharacterListView, content: {
                NavigationStack(root: {
                    CharacterListView()
                })
            })

        })
        .background {
            Image(viewModel.background, bundle: .main)
                .background(.black)
        }
    }

    var logo: some View {
        Image(viewModel.logoIntro, bundle: .main)
            .resizable()
            .frame(height: 100)
            .padding(.leading, 40)
            .padding(.trailing, 40)
    }

    private var enterButton: some View {
        Button(action: {
            viewModel.showingCharacterListView.toggle()
        }, label: {
            Text(viewModel.titleButton)
        })
        .frame(height: 60)
        .padding(.leading, 40)
        .padding(.trailing, 40)
        .buttonStyle(FenixButtonStyle())
        .id(viewModel.idEnterButton)
        .phaseAnimator([false, true], content: { content, phase in
            content.scaleEffect(phase ? 1.5 : 1.0)
        }, animation: { _ in
                .easeInOut(duration: 1.0)
        })
    }

    private var messageText: some View {
        Text(viewModel.messageText)
            .multilineTextAlignment(.center)
            .padding(.leading, 40)
            .padding(.trailing, 40)
            .fenixMessageTextStyled
            .id(viewModel.idMessageText)
    }
}

#Preview {
    IntroView()
}
