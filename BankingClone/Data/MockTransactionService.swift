//
//  MockTransactionService.swift
//  BankingClone
//
//  Created by Macpro M2    on 5/3/26.
//
import Foundation
class MockTransactionService: TransactionServiceProtocol {

    func fetchTransactions() async throws -> [Transaction] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)

        return [
            Transaction(
                id: 1,
                amount: 2_000_000,
                type: .income,
                date: Date(),
                description: "Salary"
            ),
            Transaction(
                id: 2,
                amount: 150_000,
                type: .expense,
                date: Date(),
                description: "Coffee"
            ),
            Transaction(
                id: 3,
                amount: 500_000,
                type: .expense,
                date: Date(),
                description: "Shopping"
            )
        ]
    }

}
