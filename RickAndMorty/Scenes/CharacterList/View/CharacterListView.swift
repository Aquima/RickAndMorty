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
            List { ForEach(viewModel.previewCharacters, id: \.id) { character in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        CharacterItemView(character: .constant(character))
                            .background(.clear)
                    }.listRowSeparator(.hidden)
                }
                CharacterLastRowView(paginationState: viewModel.paginationState,
                                     loadMoreItems: viewModel.loadMoreItems)
                    .listRowSeparator(.hidden)
                    .id("CharacterLastRowView")
            }
            .listStyle(.plain)
            .navigationTitle(viewModel.titleNavigation)
            .font(.subheadline)
            .padding([.leading, .trailing], 0)
            .navigationBarTitleDisplayMode(.inline)
            .id("CharactersList")
        }
    }

}

#Preview {
    CharacterListView()
}
