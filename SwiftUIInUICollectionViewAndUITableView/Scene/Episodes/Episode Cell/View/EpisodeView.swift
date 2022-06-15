//
//  EpisodeView.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import SwiftUI

protocol EpisodeViewOutput: AnyObject {
    func didTapButton(with viewModel: EpisodeTableViewCellViewModel, isExpanded: Bool)
}

struct EpisodeView: View {

    weak var output: EpisodeViewOutput?

    @State var isExpanded = false

    var viewModel: EpisodeTableViewCellViewModel

    var body: some View {
        VStack(alignment: .center, content: {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Episode Name: \(viewModel.episodeName)")
                        .font(.caption)
                        .foregroundColor(.customLightGray)
                    Text("\(viewModel.episode)")
                        .font(.caption)
                        .foregroundColor(.white)
                    Text("Publish Date: \(viewModel.publishDate)")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                Spacer()
                Button {
                    isExpanded = !isExpanded
                    output?.didTapButton(with: viewModel, isExpanded: isExpanded)
                } label: {
                    Text(isExpanded ? "Show Less" : "Show More")
                        .padding(10)
                        .bold()
                }
                .tint(Color.white)
                .background(Color.orange)
                .cornerRadius(8)
            }
            if isExpanded {
                EpisodeScrollView(characters: viewModel.characters)
            }
        })
        .padding(8)
        .background(Color.customDarkGray)
        .cornerRadius(8)
        .shadow(radius: 4, x: 2, y: 2)
    }
}
