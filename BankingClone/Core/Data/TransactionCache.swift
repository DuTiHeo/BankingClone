//
//  TransactionCache.swift
//  BankingClone
//
//  Created by Macpro M2    on 16/3/26.
//

import Foundation

struct TransactionCache {
    private let fileName = "transactions_cache.json"

    private var fileURL: URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)
    }

    func load() throws -> [Transaction] {

        if !FileManager.default.fileExists(atPath: fileURL.path) {
            return []
        }

        let data = try Data(contentsOf: fileURL)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try decoder.decode([Transaction].self, from: data)
    }


    func save(_ items: [Transaction]) throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(items)
        try data.write(to: fileURL, options: [.atomic])
    }
}
