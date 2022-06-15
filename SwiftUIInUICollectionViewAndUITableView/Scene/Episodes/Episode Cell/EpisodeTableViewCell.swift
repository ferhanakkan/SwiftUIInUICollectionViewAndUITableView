//
//  EpisodeTableViewCell.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import UIKit
import SwiftUI

protocol EpisodeTableViewCellOutput: EpisodeViewOutput {
    func didTapDelete(_ cell: EpisodeTableViewCell)
}

final class EpisodeTableViewCell: UITableViewCell {

    weak var output: EpisodeTableViewCellOutput?

    override func prepareForReuse() {
        super.prepareForReuse()

        contentConfiguration = nil
    }

    func configure(with viewModel: EpisodeTableViewCellViewModel) {
        self.contentConfiguration = UIHostingConfiguration {
            EpisodeView(output: self, isExpanded: viewModel.isExpanded, viewModel: viewModel)
                .swipeActions(allowsFullSwipe: true) {
                    Button("Delete") { [weak self] in
                        guard let self else {
                            return
                        }
                        self.output?.didTapDelete(self)
                    }
                }
                .tint(Color.red)
        }
        .background(.white)
        .margins(.all, 20)
    }
}

extension EpisodeTableViewCell: EpisodeViewOutput {
    func didTapButton(with viewModel: EpisodeTableViewCellViewModel, isExpanded: Bool) {
        output?.didTapButton(with: viewModel, isExpanded: isExpanded)
        //UIView.performWithoutAnimation {
         //   self.invalidateIntrinsicContentSize()
        //}
    }
}
