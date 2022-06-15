//
//  CharacterDetailsView.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import SwiftUI

struct CharacterDetailsView: View {

    private let lastKnown: String
    private let firstSeen: String
    private let gender: String
    private let status: String

    init(lastKnown: String, firstSeen: String, gender: String, status: String) {
        self.lastKnown = lastKnown
        self.firstSeen = firstSeen
        self.gender = gender
        self.status = status
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Details")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            CharacterTitleDescriptionView(title: "Last known location:", description: lastKnown)
            CharacterTitleDescriptionView(title: "First seen in", description: firstSeen)
            CharacterTitleDescriptionView(title: "Gender:", description: gender)
            CharacterTitleDescriptionView(title: "Status:", description: status)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}
