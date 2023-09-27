//
//  CharactersEndPoint.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation

public enum CharactersEndPoint {
    case get(page: Int = 1)

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(page):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/character"
            components.queryItems = [
                URLQueryItem(name: "page", value: "\(page)")
            ].compactMap { $0 }
            return components.url!
        }
    }
}
