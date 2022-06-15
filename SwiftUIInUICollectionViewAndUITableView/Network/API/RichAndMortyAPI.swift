//
//  RichAndMortyAPI.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

protocol RichAndMortyAPIProtocol {
    var networkLayer: NetworkManager { get }
    func fetchCharacters(request: CharactersRequest, onSuccess: @escaping ((CharactersRequest.ResponseType) -> Void), onFailure: @escaping ((Error) -> Void))
    func fetchEpisodes(request: EpisodesRequest, onSuccess: @escaping ((EpisodesRequest.ResponseType) -> Void), onFailure: @escaping ((Error) -> Void))
}

final class RichAndMortyAPI: RichAndMortyAPIProtocol {

    var networkLayer: NetworkManager

    init(networkLayer: NetworkManager) {
        self.networkLayer = networkLayer
    }

    func fetchCharacters(
        request: CharactersRequest,
        onSuccess: @escaping ((CharactersRequest.ResponseType) -> Void),
        onFailure: @escaping ((Error) -> Void)
    ) {
        networkLayer.genericFetch(with: request) { result in
            switch result {
            case .success(let response):
                onSuccess(response)
            case .failure(let error):
               onFailure(error)
            }
        }
    }

    func fetchEpisodes(
        request: EpisodesRequest,
        onSuccess: @escaping ((EpisodesRequest.ResponseType) -> Void),
        onFailure: @escaping ((Error) -> Void)
    ) {
        networkLayer.genericFetch(with: request) { result in
            switch result {
            case .success(let response):
                onSuccess(response)
            case .failure(let error):
               onFailure(error)
            }
        }
    }
}
