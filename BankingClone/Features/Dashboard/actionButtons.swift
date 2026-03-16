//
//  actionButtons.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/03.
//

import SwiftUI

extension DashboardView {
    
    var actionButtons: some View {
        HStack(spacing: 16) {
            
            NavigationLink {
                TransactionListView(viewModel/*đây là thuộc tính của TransactionListView*/ : viewModel)
            } label: {
                Text("View Transactions")
            }
            .buttonStyle(.borderedProminent)
            
            
            Button("Transfer Money") {
                print("Bấm con cặc")
            }
            .buttonStyle(.bordered)
        }
    }
}
