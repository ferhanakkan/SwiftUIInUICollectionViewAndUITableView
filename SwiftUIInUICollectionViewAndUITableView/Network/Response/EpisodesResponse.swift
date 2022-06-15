//
//  EpisodesResponse.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

// MARK: - EpisodesResponse
struct EpisodesResponse: Codable {
    let results: [EpisodeResult]?
}

// MARK: - Result
struct EpisodeResult: Codable {
    let id: Int?
    let name, airDate, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
