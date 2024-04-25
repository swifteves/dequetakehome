//
//  Network.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

struct Endpoint<T: Decodable> {
    var url: URL
    var type: T.Type
}

extension Endpoint where T == ResultsContainer {
    static let characters = Endpoint(url: URL(string: "https://www.giantbomb.com/api/characters/?api_key=ea98adc584efb356fcd14b949f8a9f2aa2b270b8&format=json")!, type: ResultsContainer.self)
}

struct Network {
    static func fetch<T>(_ resource: Endpoint<T>, session: URLSession = .shared) async throws -> T {
        let (data, _) = try await session.data(from: resource.url)
        let decoder = JSONDecoder()
        
        do {
            let decoded = try decoder.decode(T.self, from: data)
            return decoded
        } catch DecodingError.keyNotFound(let key, let context) {
            // swiftlint:disable:next line_length
            fatalError("Failed to decode due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            // swiftlint:disable:next line_length
            fatalError("Failed to decode due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode: \(error.localizedDescription)")
        }
    }
}
