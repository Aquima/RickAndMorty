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
                Text(character.name).fenixTitleCharacterTextStyled
                Text(character.status.rawValue)
                    .fenixTextStyled(character.status)
            }
        }
    }

    var imageCharacterLoader: some View {
        CachedAsyncImage(url: .init(string: character.image)) { image in
            image.resizable()
                .frame(width: 150, height: 150)
                .border(Color.black.opacity(0.5), width: 2)
        } placeholder: {
            ProgressView()
                .frame(height: 45,
                       alignment: .center)
        }
    }
}

#Preview {
    return CharacterItemView(character: .constant(RyckAndMortyCharactersListStub.previewCharacters[0]))

}
