//
//  transactionSection.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/03.
//

import SwiftUI

extension DashboardView {
    
    var transactionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Recent Transactions")
                .font(.headline)
            
            ForEach(viewModel.recentTransactions) { transaction in
                NavigationLink {
                    TransactionDetailView(transaction: transaction)
                } label: {
                    TransactionRowView(transaction: transaction)
                        .foregroundStyle(.black)
                }
            }
        }
    }
    
    // Nếu không còn dùng ở nơi khác, có thể xoá hàm này.
    // Giữ lại comment để tham chiếu:
    /*
    func transactionRow(_ transaction: Transaction) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.description)
                Text(transaction.date, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(
                transaction.amount,
                format: .currency(code: "VND")
            )
            .foregroundStyle(
                transaction.type == .income ? .green : .red
            )
        }
        .padding(.vertical, 4)
    }
    */
}
