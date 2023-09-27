//
//  CharacterItemView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI
import CachedAsyncImage

struct CharacterItemView: View {

    let character: RyckAndMortyCharacter

    var body: some View {
        VStack(spacing: .zero) {
            headerCharacterItem
            imageCharacterLoader
        }
        .background(.clear)
    }

    var headerCharacterItem: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15, height: 15)
                .clipped()
                .clipShape(Rectangle())

            VStack(alignment: .leading) {
                Text(character.name)
                    .fontWeight(.bold)
                    .fenixTitleCharacterTextStyled
                Text(character.status.rawValue)
                    .fenixTextStyled
            }
        }
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .padding([.leading, .trailing], 10)
        .padding(.vertical, 15)
        .background(.clear)
    }
    var imageCharacterLoader: some View {
        CachedAsyncImage(url: .init(string: character.image)) { image in
            image.resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(maxWidth: .infinity,
                        alignment: .center)
                 .clipped()
                 .padding([.leading, .trailing], 0)
        } placeholder: {
            ProgressView()
                .frame(height: 250,
                       alignment: .center)
        }
    }
}

#Preview {
    let previewCharacter = RyckAndMortyCharacter(id: UUID(), dbid: 1,
                                                 name: "Rick",
                                                 status: .alive,
                                                 image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    return CharacterItemView(character: previewCharacter)

}
