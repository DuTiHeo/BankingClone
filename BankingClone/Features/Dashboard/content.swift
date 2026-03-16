//
//  content.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/04.
//
import SwiftUI
import Foundation

extension DashboardView {
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
            
        case .loading:
            ProgressView()
                .frame(maxHeight: .infinity)
            
        case .error(let message):
            VStack(spacing: 12) {
                Text(message)
                    .foregroundStyle(.red)
                
                Button("Retry") {
                    Task {
                        await viewModel.loadData()
                    }
                }
            }
            .frame(maxHeight: .infinity)
            
        case .success:
            dashboardContent
        }
    }
    
    private var dashboardContent: some View {
        VStack(spacing: 20) {
            accountSection
            actionButtons
            transactionSection
            HStack {
                VStack(alignment: .leading) {
                    Text("Total income")
                    Text(viewModel.totalIncome, format: .currency(code: "VND"))
                        .foregroundStyle(.green)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Total expense")
                    Text(viewModel.totalExpense, format: .currency(code: "VND"))
                        .foregroundStyle(.red)
                }
            }
            Spacer()
        }
    }
}
