//
//  EpisodesRequest.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

struct EpisodesRequest: Endpoint {
    typealias ResponseType = EpisodesResponse

    var path: String {
        "episode"
    }

    var httpMethod: HTTPRequestMethod {
        .get
    }
}
