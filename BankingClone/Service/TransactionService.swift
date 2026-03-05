//
//  TransactionService.swift
//  BankingClone
//
//  Created by Macpro M2    on 5/3/26.
//

import Foundation

struct TransactionService: TransactionServiceProtocol {
    func fetchTransactions() async -> [Transaction] {
        try? await Task.sleep(nanoseconds: 300_000_000)
        return MockData.transactions
    }
}
