//
//  DashboardViewModel.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/03.
//

import Foundation

@Observable
@MainActor
final class DashboardViewModel {
    
    var account: Account?
    var transactions: [Transaction] = []
    private let service: TransactionServiceProtocol
    var state: ViewState = .loading
    var selectedFilter: TransactionFilter = .all
    var searchText: String = ""
    var isLoading = false
    private let cache = TransactionCache()

    init(service: TransactionServiceProtocol) {
            self.service = service
    }
    var groupedTransactions: [(date: Date, items: [Transaction])] {
        
        let grouped = Dictionary(grouping: filteredTransactions) { transaction in
            Calendar.current.startOfDay(for: transaction.date)
        }
        
        return grouped
            .map { (date: $0.key, items: $0.value) }
            .sorted { $0.date > $1.date }
    }
    var filteredTransactions: [Transaction] {
        
        // Sort
        let sorted = transactions.sorted {
            $0.date > $1.date
        }
        
        // Filter theo loại
        let filteredByType: [Transaction]
        
        switch selectedFilter {
        case .all:
            filteredByType = sorted
            
        case .income:
            filteredByType = sorted.filter { $0.type == .income }
            
        case .expense:
            filteredByType = sorted.filter { $0.type == .expense }
        }
        
        // Search
        if searchText.isEmpty {
            return filteredByType
        } else {
            return filteredByType.filter {
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    func loadData() async {
        if isLoading { return }
        isLoading = true
        defer { isLoading = false }

        if transactions.isEmpty, let cached = try? cache.load() {
            transactions = cached
            state = .success
        } else {
            state = .loading
        }

        do {
            account = MockData.account
            transactions = try await service.fetchTransactions()
            try? cache.save(transactions)
            state = .success
        } catch {
            let message = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
            state = .error(message)
        }
    }

    var recentTransactions: [Transaction] {
        transactions.prefix(3).map { $0 }
    }
    
    var totalIncome: Double {
        transactions
            .filter { $0.type == .income }
            .reduce(0) { $0 + $1.amount }
    }

    var totalExpense: Double {
        transactions
            .filter { $0.type == .expense }
            .reduce(0) { $0 + $1.amount }
    }

    var netFlow: Double {
        totalIncome - totalExpense
    }

    var displayBalance: Double {
        account?.balance ?? 0
    }

    var displayOwnerName: String {
        account?.ownerName ?? "Unknown"
    }

}
