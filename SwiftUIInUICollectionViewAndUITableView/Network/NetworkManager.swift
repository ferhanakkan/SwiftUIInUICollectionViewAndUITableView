//
//  NetworkManager.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

final class NetworkManager {

    func genericFetch<EndpointType: Endpoint>(with request: EndpointType, completion: @escaping ( (Result<EndpointType.ResponseType, Error>) -> Void)) {
        var urlRequest = URLRequest(url: request.fullUrl)
        urlRequest.httpMethod = request.httpMethod.rawValue
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let responseObject = try JSONDecoder().decode(EndpointType.ResponseType.self, from: data)
                        completion(.success(responseObject))
                    } catch {
                        completion(.failure(error))
                    }
                } else if let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
