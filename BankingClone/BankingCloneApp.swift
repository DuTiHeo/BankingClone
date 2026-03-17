//
//  BankingCloneApp.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/03.
//

import SwiftUI

@main
struct BankingCloneApp: App {
    let service: TransactionServiceProtocol
    let viewModel: DashboardViewModel

    init() {
        let service = ApiTransactionService()
        self.service = service
        self.viewModel = DashboardViewModel(service: service)
    }

    var body: some Scene {
        WindowGroup {
            // If DashboardView has an initializer that accepts the view model:
            // DashboardView(viewModel: viewModel)

            // If DashboardView expects an EnvironmentObject instead:
            // DashboardView().environmentObject(viewModel)

            DashboardView(viewModel: viewModel)
        }
    }
}
