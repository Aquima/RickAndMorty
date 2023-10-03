//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private(set) var viewModel: CharacterListViewModel
    @State var searchTerm: String = ""
    init() {
        _viewModel = ObservedObject(wrappedValue: CharacterListViewModel())
    }

    var body: some View {
        NavigationStack {
            List { ForEach(viewModel.previewCharacters, id: \.id) { character in
                    NavigationLink {
                        CharacterDetailView(currentCharacter: .constant(character))
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
            .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchTerm) { oldValue, newValue in
                if oldValue.count > 1 {
                    viewModel.searchName = newValue
                    viewModel.loadMoreItems()
                } else {
                    viewModel.searchName = ""
                }
            }
        }
    }

}

#Preview {
    CharacterListView()
}
