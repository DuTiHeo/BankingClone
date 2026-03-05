//
//  TransactionService.swift
//  BankingClone
//
//  Created by Macpro M2    on 5/3/26.
//

import Foundation

protocol TransactionServiceProtocol {
    func fetchTransactions() async throws -> [Transaction]
}
