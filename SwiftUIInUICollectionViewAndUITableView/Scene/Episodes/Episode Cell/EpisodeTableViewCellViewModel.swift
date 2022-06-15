//
//  EpisodeTableViewCellViewModel.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

struct EpisodeTableViewCellViewModel {
    let episodeName: String
    let publishDate: String
    let episode: String
    let characters: [Character]
    var isExpanded: Bool

    init?(with episodeResult: EpisodeResult, characters: [CharacterResult]) {
        guard
            let episodeName = episodeResult.name,
            let publishDate = episodeResult.airDate,
            let episode = episodeResult.episode
        else {
            return nil
        }
        self.episodeName = episodeName
        self.publishDate = publishDate
        self.episode = episode
        self.characters = characters.compactMap(Character.init)
        self.isExpanded = false
    }

    struct Character: Hashable {
        let name: String
        let imageUrl: URL?

        init?(with response: CharacterResult) {
            guard
                let name = response.name,
                let imageUrl = response.image
            else {
                return nil
            }
            self.name = name
            self.imageUrl = .init(string: imageUrl)
        }
    }
}
