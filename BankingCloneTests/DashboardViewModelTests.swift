//
//  DashboardViewModelTests.swift
//  BankingClone
//
//  Created by Macpro M2    on 16/3/26.
//

import XCTest
@testable import BankingClone

final class TestTransactionService: TransactionServiceProtocol {
    let result: Result<[Transaction], Error>
    init(result: Result<[Transaction], Error>) { self.result = result }

    func fetchTransactions() async throws -> [Transaction] {
        switch result {
        case .success(let items): return items
        case .failure(let error): throw error
        }
    }
}

enum TestError: LocalizedError {
    case sample
    var errorDescription: String? { "Sample error" }
}
@MainActor
final class DashboardViewModelTests: XCTestCase {

    func testLoadDataSuccess() async {
        let items = [
            Transaction(id: 1, amount: 100, type: .income, date: .now, description: "Salary")
        ]
        let vm = DashboardViewModel(service: TestTransactionService(result: .success(items)))

        await vm.loadData()

        switch vm.state {
        case .success: break
        default: XCTFail("Expected success state")
        }
        XCTAssertEqual(vm.transactions.count, 1)
        XCTAssertNotNil(vm.account)
    }
    func testLoadDataError() async {
        let vm = DashboardViewModel(service: TestTransactionService(result: .failure(TestError.sample)))

        await vm.loadData()

        if case .error(let message) = vm.state {
            XCTAssertEqual(message, "Sample error")
        } else {
            XCTFail("Expected error state")
        }
    }
    
    func testFilterAndNetFlow() {
        let vm = DashboardViewModel(service: TestTransactionService(result: .success([])))
        vm.transactions = [
            Transaction(id: 1, amount: 1000, type: .income, date: .now, description: "Salary"),
            Transaction(id: 2, amount: 200, type: .expense, date: .now, description: "Coffee")
        ]

        vm.selectedFilter = .income
        XCTAssertEqual(vm.filteredTransactions.count, 1)

        vm.searchText = "Coffee"
        XCTAssertEqual(vm.filteredTransactions.count, 0) // search applied after filter

        XCTAssertEqual(vm.netFlow, 800, accuracy: 0.001)
    }

}


