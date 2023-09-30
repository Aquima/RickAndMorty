//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private(set) var viewModel: CharacterListViewModel

    init() {
        _viewModel = ObservedObject(wrappedValue: CharacterListViewModel())
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
                    .id("CharacterLastRowView")
            }
            .listStyle(.plain)
            .navigationTitle(viewModel.titleNavigation)
            .font(.subheadline)
            .background(.white)
            .padding([.leading, .trailing], 0)
            .id("CharactersList")
        }
    }

}

#Preview {
    CharacterListView()
}
