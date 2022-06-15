//
//  Endpoint.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import Foundation

typealias NetworkResponse<Response: Decodable> = (Result<Response, Error>) -> Void

enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    associatedtype ResponseType: Decodable
    var baseUrl: URL { get }
    var path: String { get }
    var fullUrl: URL { get }
    var httpMethod: HTTPRequestMethod { get }
}

extension Endpoint {
    var baseUrl: URL {
        URL(string: "https://rickandmortyapi.com/api/")!
    }

    var fullUrl: URL {
        URL(string: baseUrl.absoluteString+path)!
    }
}
