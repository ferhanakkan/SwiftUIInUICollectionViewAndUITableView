//
//  CharacterCollectionViewCell.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import UIKit
import SwiftUI

protocol CharacterCollectionViewCellOutput: CharacterViewOutput {}

final class CharacterCollectionViewCell: UICollectionViewCell {

    weak var output: CharacterCollectionViewCellOutput?

    override func prepareForReuse() {
        super.prepareForReuse()

        contentConfiguration = nil
    }

    func configure(with viewModel: CharacterCollectionViewCellViewModel) {
        self.contentConfiguration = UIHostingConfiguration {
            var view = CharacterView(isExpanded: viewModel.isExpanded, viewModel: viewModel)
            view.output = self
            return view
        }
        .background(.white)
        .margins(.all, 20)
    }
}

extension CharacterCollectionViewCell: CharacterViewOutput {
    func didTapButton(with viewModel: CharacterCollectionViewCellViewModel, isExpanded: Bool) {
        output?.didTapButton(with: viewModel, isExpanded: isExpanded)
        //UIView.performWithoutAnimation {
         //   self.invalidateIntrinsicContentSize()
        //}
    }
}
