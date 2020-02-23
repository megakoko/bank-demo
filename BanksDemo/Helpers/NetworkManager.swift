//
//  NetworkManager.swift
//  BanksDemo
//
//  Created by Andrey on 23.02.2020.
//  Copyright © 2020 Andrey Chukavin. All rights reserved.
//

import Foundation

class NetworkManager {
    private struct NetworkResult<T:Decodable>: Decodable {
        let results: T
        let results_uri: String
        let status: String
        let task_id: String
    }

    static let shared = NetworkManager()

    private let baseUrl = "https://pay-api.truelayer.com"

    private init() {

    }

    private func get<T:Decodable>(url: URL, completionHandler: @escaping (T?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            var result: T? = nil

            if let error = error {
                print("Failed to perform request: \(error)")
            }

            if let data = data {
                let decoder = JSONDecoder()
                let decodedData = try? decoder.decode(NetworkResult<T>.self, from: data)
                if let decodedData = decodedData {
                    result = decodedData.results
                }
            }

            completionHandler(result)
        }
        task.resume()
    }
}

extension NetworkManager {
    func getBanks(completionHandler: @escaping ([Bank]?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/providers?capability=SingleImmediatePayment") else {
            completionHandler(nil)
            return
        }

        get(url: url, completionHandler: completionHandler)
    }
}
