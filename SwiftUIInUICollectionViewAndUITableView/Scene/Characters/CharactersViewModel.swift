//
//  CharactersViewModel.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

protocol CharactersViewModelOutput: AnyObject {
    func didFetchCompleted()
}

final class CharactersViewModel {

    var datas: [CharacterCollectionViewCellViewModel]

    weak var output: CharactersViewModelOutput?

    private let api: RichAndMortyAPIProtocol

    init(api: RichAndMortyAPIProtocol) {
        self.api = api
        datas = []
    }

    func viewDidLoad() {
        fetchCharacters()
    }

    func updateDatas(viewModel: CharacterCollectionViewCellViewModel, isExpanded: Bool) {
        if let index = datas.firstIndex(where: { $0.id == viewModel.id}) {
            datas[index].isExpanded.toggle()
        }
    }

    private func fetchCharacters() {
        api.fetchCharacters(request: .init()) { [weak self] response in
            guard let results = response.results else {
                return
            }
            self?.datas = results.compactMap(CharacterCollectionViewCellViewModel.init)
            self?.output?.didFetchCompleted()
        } onFailure: { error in
            print(error)
        }
    }
}
