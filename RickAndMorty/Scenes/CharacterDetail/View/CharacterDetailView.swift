//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Raul quispe on 2/10/23.
//

import SwiftUI
import CachedAsyncImage

struct CharacterDetailView: View {
    @Binding var currentCharacter: RyckAndMortyCharacter
    var body: some View {
        VStack(spacing: 20, content: {
            name
            image
            status
            specie
            gender
        })
    }

    private var name: some View {
        HStack(content: {
            Text("Name:")
                .fenixTitleCharacterTextStyled
            Text(currentCharacter.name)
                .fenixTitleCharacterTextStyled
        })
    }

    private var status: some View {
        HStack(content: {
            Text("Status:")
            Text(currentCharacter.status.rawValue)
                .fenixTextStyled(currentCharacter.status)
        })
    }

    private var specie: some View {
        HStack(content: {
            Text("Specie:")
            Text(currentCharacter.species.rawValue)
        })
    }

    private var gender: some View {
        HStack(content: {
            Text("Gender:")
            Text(currentCharacter.gender.rawValue)
        })
    }

    private var image: some View {
        CachedAsyncImage(url: .init(string: currentCharacter.image)) { image in
            image.resizable()
                .frame(width: 150, height: 150)
                .border(Color.black.opacity(0.5), width: 2)
                .id("CharacterImage")
        } placeholder: {
            ProgressView()
                .frame(width: 150,
                       height: 150,
                       alignment: .center)
        }
    }
}

#Preview {
    CharacterDetailView(currentCharacter: .constant(RyckAndMortyCharactersListStub.previewCharacters[0]))
}
