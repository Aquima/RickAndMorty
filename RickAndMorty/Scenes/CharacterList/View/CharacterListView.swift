//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel: CharacterListViewModel
    init() {
        _viewModel = StateObject(wrappedValue: CharacterListViewModel())
    }
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.previewCharacters, id: \.id) { character in
                    CharacterItemView(character: character)
                }
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    CharacterListView()
}
