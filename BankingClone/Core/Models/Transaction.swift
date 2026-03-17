//
//  Transaction.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/03.
//
import Foundation
struct Transaction: Codable, Identifiable {
    let id: Int
    let amount: Double
    let type: TransactionType
    let date: Date
    let description: String
}
