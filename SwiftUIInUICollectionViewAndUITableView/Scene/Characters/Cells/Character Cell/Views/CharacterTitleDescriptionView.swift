//
//  CharacterTitleDescriptionView.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import SwiftUI

struct CharacterTitleDescriptionView: View {

    private let title: String
    private let description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.customLightGray)
            Text(description)
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
