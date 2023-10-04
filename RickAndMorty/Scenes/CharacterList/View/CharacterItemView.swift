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

    @State var animated: Bool = false
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
        .opacity(animated ? 1.0 : 0.2)
        .offset(CGSize(width: 0, height: animated ? -10 : 0))
        .onAppear {
            withAnimation(.easeInOut(duration: 1).delay(0.1)) {
                animated.toggle()
             }
        }.onDisappear {
            animated.toggle()
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
