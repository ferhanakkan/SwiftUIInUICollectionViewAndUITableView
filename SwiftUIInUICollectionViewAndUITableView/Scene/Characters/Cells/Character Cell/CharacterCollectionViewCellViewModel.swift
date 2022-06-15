//
//  CharacterCollectionViewCellViewModel.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation
import SwiftUI

struct CharacterCollectionViewCellViewModel {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: String
    let location: String
    let imageUrl: URL?
    var isExpanded: Bool
}

extension CharacterCollectionViewCellViewModel {
    init?(with response: CharacterResult) {
        guard
            let id = response.id,
            let name = response.name,
            let status = response.status,
            let species = response.species,
            let gender = response.gender,
            let origin = response.origin?.name,
            let location = response.location?.name,
            let image = response.image
        else {
            return nil
        }
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.origin = origin
        self.location = location
        self.imageUrl  = .init(string: image)
        self.isExpanded = false
    }
}
