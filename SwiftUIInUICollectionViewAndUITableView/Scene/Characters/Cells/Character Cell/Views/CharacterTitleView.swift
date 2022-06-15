//
//  CharacterTitleView.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import SwiftUI

struct CharacterTitleView: View {

    private let name: String
    private let species: String

    init(name: String, species: String) {
        self.name = name
        self.species = species
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(.title3)
                .foregroundColor(.white)
            Text(species)
                .font(.caption)
                .foregroundColor(.white)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}
