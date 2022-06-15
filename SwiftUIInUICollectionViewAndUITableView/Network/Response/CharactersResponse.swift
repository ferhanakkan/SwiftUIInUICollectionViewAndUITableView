//
//  CharactersResponse.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

struct CharactersResponse: Codable {
    let results: [CharacterResult]?
}

// MARK: - Result
struct CharacterResult: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: CharacterLocation?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct CharacterLocation: Codable {
    let name: String?
    let url: String?
}
