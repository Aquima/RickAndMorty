//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private(set) var viewModel: CharacterListViewModel
    @State private var searchTerm: String = ""

    init() {
        _viewModel = ObservedObject(wrappedValue: CharacterListViewModel())
    }

    var body: some View {
        NavigationStack {
            CharactersList(viewModel: viewModel, searchTerm: $searchTerm)
                .navigationTitle(viewModel.titleNavigation)
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always))
                .onChange(of: searchTerm) { oldValue, newValue in
                    handleSearchTermChange(oldValue: oldValue, newValue: newValue)
                }
        }
    }

    private func handleSearchTermChange(oldValue: String, newValue: String) {
        if oldValue.count > 1 {
            viewModel.searchName = newValue
            viewModel.loadMoreItems()
        } else {
            viewModel.searchName = ""
        }
    }
}

struct CharactersList: View {
    @ObservedObject var viewModel: CharacterListViewModel
    @Binding var searchTerm: String

    var body: some View {
        List {
            characterItems
            paginationView
        }
        .listStyle(.plain)
        .padding([.leading, .trailing], 0)
        .id("CharactersList")
    }

    private var characterItems: some View {
        ForEach(viewModel.previewCharacters, id: \.id) { character in
            NavigationLink {
                CharacterDetailView(currentCharacter: .constant(character))
            } label: {
                CharacterItemView(character: .constant(character))
                    .background(.clear)
            }
            .listRowSeparator(.hidden)
        }
    }

    private var paginationView: some View {
        CharacterLastRowView(paginationState: viewModel.paginationState, loadMoreItems: viewModel.loadMoreItems)
            .listRowSeparator(.hidden)
            .id("CharacterLastRowView")
    }
}

#Preview {
    CharacterListView()
}
