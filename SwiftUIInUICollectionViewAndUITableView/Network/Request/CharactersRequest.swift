//
//  CharactersRequest.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

struct CharactersRequest: Endpoint {
    typealias ResponseType = CharactersResponse

    var path: String {
        "character"
    }

    var httpMethod: HTTPRequestMethod {
        .get
    }
}
