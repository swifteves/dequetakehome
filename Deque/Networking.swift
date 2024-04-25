//
//  Networking.swift
//  Deque
//
//  Created by Adrian Eves on 4/23/24.
//

import Foundation

protocol FetchNetwork {
    func getData<T: Decodable>(url urlString: String) async -> T?
}

// TODO: Might want to specialise this per class.
class DequeNetworking: FetchNetwork {
    func getData<T: Decodable>(url urlString: String) async -> T? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let resultContainer = try await URLSession.shared.decode(T.self, from: url)
            return resultContainer
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
}

// The following extension was developed by my friend, Paul, at
// https:www.hackingwithswift.com/
// example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way
//
// While I understand the principles used here, I know this exists
// as a resource and have therefore elected to use it.

extension URLSession {
    func decode<T: Decodable>(
        _ type: T.Type = T.self,
        from url: URL,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dataDecodingStrategy: JSONDecoder.DataDecodingStrategy = .deferredToData,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    ) async throws  -> T {
        let (data, _) = try await data(from: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy

        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
