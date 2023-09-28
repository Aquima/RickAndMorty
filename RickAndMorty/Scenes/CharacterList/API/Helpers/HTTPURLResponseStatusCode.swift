//
//  HTTPURLResponseStatusCode.swift
//  RickAndMorty
//
//  Created by Raul Quispe  on 26/09/23.
//

import Foundation

extension HTTPURLResponse {
    private static var OK200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK200
    }
}
