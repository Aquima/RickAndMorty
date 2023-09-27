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
                        .background(.white)
                        .listRowSeparator(.hidden)
                        .border(Color(UIColor.lightGray))
                }
                CharacterLastRowView(paginationState: viewModel.paginationState,
                                     loadMoreItems: viewModel.loadMoreItems)
                    .background(.white)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Characters")
            .font(.subheadline)
            .background(.white)
            .padding([.leading, .trailing], 0)
        }
    }

}

#Preview {
    CharacterListView()
}
