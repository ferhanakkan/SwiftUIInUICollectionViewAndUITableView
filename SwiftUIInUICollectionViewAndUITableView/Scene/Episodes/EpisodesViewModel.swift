//
//  EpisodesViewModel.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

protocol EpisodesViewModelOutput: AnyObject {
    func didFetchCompleted()
}

final class EpisodesViewModel {

    var datas: [EpisodeTableViewCellViewModel]

    weak var output: EpisodesViewModelOutput?

    private let api: RichAndMortyAPIProtocol

    init(api: RichAndMortyAPIProtocol) {
        self.api = api
        datas = []
    }

    func viewDidLoad() {
        fetchCharacters { [weak self] characterResults in
            self?.fetchEpisodes { [weak self] episodeResults in
                self?.datas = episodeResults.compactMap({
                    EpisodeTableViewCellViewModel.init(with: $0, characters: characterResults)
                })
                self?.output?.didFetchCompleted()
            }
        }
    }

    func updateDatas(viewModel: EpisodeTableViewCellViewModel, isExpanded: Bool) {
        if let index = datas.firstIndex(where: { $0.episodeName == viewModel.episodeName} ) {
            datas[index].isExpanded.toggle()
        }
    }

    func deleteData(with indexPath: IndexPath) {
        datas.remove(at: indexPath.row)
    }

    private func fetchCharacters(completion: @escaping (([CharacterResult]) -> Void)) {
        api.fetchCharacters(request: .init()) { [weak self] response in
            guard let results = response.results else {
                return
            }
            completion(results)
        } onFailure: { error in
            print(error)
        }
    }

    private func fetchEpisodes(completion: @escaping (([EpisodeResult]) -> Void)) {
        api.fetchEpisodes(request: .init()) { [weak self] response in
            guard let results = response.results else {
                return
            }
            completion(results)
        } onFailure: { error in
            print(error)
        }
    }
}
