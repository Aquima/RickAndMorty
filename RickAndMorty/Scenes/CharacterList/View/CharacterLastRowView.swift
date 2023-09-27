//
//  CharacterLastRowView.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import SwiftUI

struct CharacterLastRowView: View {

    let paginationState: CharacterListViewModel.PaginationState
    let loadMoreItems: () -> Void

    var body: some View {
        switch paginationState {
        case .loadMore:
            Color.clear
                .onAppear {
                    loadMoreItems()
                }
        case .isLoading:
            ProgressView()
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity)
        case .loadedAll:
            EmptyView()
        case .noResults:
            Text("Sorry Could not find anything.")
                .foregroundColor(.gray)
        case .error(let message):
            Text(message)
                .foregroundColor(.pink)
        }
    }
}

struct ListPlaceholderRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterLastRowView(paginationState: .noResults,
                             loadMoreItems: { })
    }
}
