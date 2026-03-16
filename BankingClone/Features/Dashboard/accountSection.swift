//
//  accountSection.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/03.
//

import SwiftUI

extension DashboardView {
    
    var accountSection: some View {
        VStack(spacing: 8) {
            Text(viewModel.displayOwnerName)
                .font(.title2)
                .bold()
            
            Text(viewModel.displayBalance, format: .currency(code: "VND"))
                .font(.largeTitle)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}
