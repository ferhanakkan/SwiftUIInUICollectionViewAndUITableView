//
//  CharactersController.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 13.06.2022.
//

import UIKit

final class CharactersController: UIViewController {

    private let viewModel: CharactersViewModel

    private lazy var collectionView: UICollectionView = { [weak self] in
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.backgroundColor = .white
        config.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: CharacterCollectionViewCell.description()
        )
        collectionView.selfSizingInvalidation = .enabledIncludingConstraints
        return collectionView
    }()

    init(with viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)

        self.viewModel.output = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        viewModel.viewDidLoad()
    }

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CharactersController: CharactersViewModelOutput {
    func didFetchCompleted() {
        collectionView.reloadData()
    }
}

extension CharactersController: CharacterCollectionViewCellOutput {
    func didTapButton(with viewModel: CharacterCollectionViewCellViewModel, isExpanded: Bool) {
        self.viewModel.updateDatas(viewModel: viewModel, isExpanded: isExpanded)
    }
}

extension CharactersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.description(),
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.output = self
        cell.configure(with: viewModel.datas[indexPath.item])
        return cell
    }
}
