//
//  CharacterView.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Kingfisher
import SwiftUI

protocol CharacterViewOutput: AnyObject {
    func didTapButton(with viewModel: CharacterCollectionViewCellViewModel, isExpanded: Bool)
}

struct CharacterView: View {

    weak var output: CharacterViewOutput?

    @State var isExpanded = false

    var viewModel: CharacterCollectionViewCellViewModel

    var body: some View {
        VStack {
            HStack(spacing: 8) {
                KFImage(viewModel.imageUrl)
                    .resizable()
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .placeholder {
                        ProgressView()
                            .tint(.white)
                    }
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                VStack {
                    CharacterTitleView(name: viewModel.name, species: viewModel.species)
                    Spacer()
                    HStack {
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
                    .padding([.trailing], 8)
                }
                .padding([.top, .bottom], 8)
            }
            if isExpanded {
                CharacterDetailsView(
                    lastKnown: viewModel.location,
                    firstSeen: viewModel.origin,
                    gender: viewModel.gender,
                    status: viewModel.status
                )
                .transition(.slide)
            }
        }
        .padding(8)
        .background(Color.customDarkGray)
        .cornerRadius(8)
        .shadow(radius: 4, x: 2, y: 2)
    }
}
