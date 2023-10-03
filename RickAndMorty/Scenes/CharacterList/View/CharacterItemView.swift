//
//  CharacterItemView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI
import CachedAsyncImage

struct CharacterItemView: View {

    @Binding var character: RyckAndMortyCharacter

    var body: some View {
        HStack {
            imageCharacterLoader
            VStack(alignment: .leading) {
                Text(character.name)
                    .fenixTitleCharacterTextStyled
                    .id("CharacterName")
                Text(character.status.rawValue)
                    .fenixTextStyled(character.status)
                    .id("CharacterStatus")
            }
        }
    }

    var imageCharacterLoader: some View {
        let boxSize = 150.00
        return CachedAsyncImage(url: .init(string: character.image)) { image in
            image.resizable()
                .frame(width: boxSize, height: boxSize)
                .border(Color.black.opacity(0.2), width: 2)
                .id("CharacterImage")
        } placeholder: {
            ProgressView()
                .frame(width: boxSize, height: boxSize,
                       alignment: .center)
                .border(Color.black.opacity(0.2), width: 2)
        }
    }
}

#Preview {
    return CharacterItemView(character: .constant(RyckAndMortyCharactersListStub.previewCharacters[0]))

}
