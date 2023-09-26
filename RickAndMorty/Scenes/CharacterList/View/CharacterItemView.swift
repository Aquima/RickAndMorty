//
//  CharacterItemView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI

struct CharacterItemView: View {

    let character: RyckAndMortyCharacter

    var body: some View {
        VStack(spacing: .zero) {
            AsyncImage(url: .init(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 130)
                    .clipped()
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {

//                PillView(id: user.id)

                Text("\(character.name) \(character.status.rawValue)")
                    .foregroundColor(.black)
                    .font(
                        .system(.body, design: .rounded)
                    )
            }
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .background(.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16,
                                    style: .continuous))
        .shadow(color: .white.opacity(0.1),
                radius: 2,
                x: 0,
                y: 1)
    }
}

#Preview {
    let previewCharacter = RyckAndMortyCharacter(name: "Rick",
                                                 status: .alive,
                                                 image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    return CharacterItemView(character: previewCharacter)

}
