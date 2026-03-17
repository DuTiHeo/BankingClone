//
//  ApiTransactionService.swift
//  BankingClone
//
//  Created by Macpro M2    on 16/3/26.
//
import Foundation

enum ApiServiceError: LocalizedError {
    case fileNotFound
    case decodeFailed
    var errorDescription: String? {
        switch self {
        case .fileNotFound: return "transactions.json not found"
        case .decodeFailed: return "Failed to decode transactions.json"
        }
    }
}

struct ApiTransactionService: TransactionServiceProtocol {
    func fetchTransactions() async throws -> [Transaction] {
        guard let url = Bundle.main.url(forResource: "transactions", withExtension: "json") else {
            throw ApiServiceError.fileNotFound
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            return try decoder.decode([Transaction].self, from: data)
        } catch {
            throw ApiServiceError.decodeFailed
        }
    }
}

