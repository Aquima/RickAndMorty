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
        NavigationStack {
            VStack(spacing: 350, content: {
                logo
                VStack(spacing: 20, content: {
                    messageText
                    enterButton
                })
                .navigationDestination(isPresented: $viewModel.showingCharacterListView) {
                    CharacterListView()
                }
            })
            .background {
                Image(viewModel.background, bundle: .main)
                    .background(.black)
            }
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
    }

    private var messageText: some View {
        Text(viewModel.messageText)
            .multilineTextAlignment(.center)
            .padding(.leading, 40)
            .padding(.trailing, 40)
            .fenixTextStyled
            .id(viewModel.idMessageText)
    }
}

#Preview {
    IntroView()
}
