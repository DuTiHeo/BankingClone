//
//  TransactionListView.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/04.
//

import SwiftUI

struct TransactionListView: View {
    
    @Bindable var viewModel: DashboardViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.groupedTransactions, id: \.date) { group in
                
                Section(
                    header: Text(group.date.formatted(date: .abbreviated, time: .omitted))
                ) {
                    ForEach(group.items) { transaction in
                        NavigationLink {
                            TransactionDetailView(transaction: transaction)
                        } label: {
                            TransactionRowView(transaction: transaction)
                        }
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .navigationTitle("Transactions")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("Filter", selection: $viewModel.selectedFilter) {
                    ForEach(TransactionFilter.allCases, id: \.self) { filter in
                        Text(filter.rawValue)
                            .tag(filter)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .refreshable {
            await viewModel.loadData()
        }

        
        
    }
}

#Preview {
    //    TransactionListView(viewModel: DashboardViewModel())

}
