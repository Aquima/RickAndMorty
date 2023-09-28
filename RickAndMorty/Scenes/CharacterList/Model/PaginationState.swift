//
//  PaginationState.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 27/09/23.
//

import Foundation

enum PaginationState {
    case isLoading
    case loadMore
    case loadedAll
    case noResults
    case error(String)
}
