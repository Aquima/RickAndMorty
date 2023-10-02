//
//  CharactersEndPoint.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation

public enum CharactersEndPoint {
    case get(page: Int = 1, name: String = "")

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(page, name):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/character"
            var queryItems: [URLQueryItem] = []
            if page != 0 {
                queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
            }
            if !name.isEmpty {
                queryItems.append(URLQueryItem(name: "name", value: "\(name)"))
            }
            components.queryItems = queryItems.compactMap { $0 }
            return components.url!
        }
    }
}
