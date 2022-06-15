//
//  EpisodeScrollView.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import SwiftUI

struct EpisodeScrollView: View {

    var characters: [EpisodeTableViewCellViewModel.Character]

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(characters.prefix(5), id: \.self) { character in
                        EpisodeCharacterView(name: character.name, imageUrl: character.imageUrl)
                    }
                }
            }
            .frame(height: 150)
        }
    }
}
