//
//  EpisodeCharacterView.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Kingfisher
import SwiftUI

struct EpisodeCharacterView: View {

    private let name: String
    private let imageUrl: URL?

    init(name: String, imageUrl: URL?) {
        self.name = name
        self.imageUrl = imageUrl
    }

    var body: some View {
        VStack {
            KFImage(imageUrl)
                .resizable()
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .placeholder {
                    ProgressView()
                        .tint(.white)
                }
                .cornerRadius(50)
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 100, alignment: .center)
            Text(name)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
    }
}
