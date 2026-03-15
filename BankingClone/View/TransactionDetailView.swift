//
//  TransactionDetailView.swift
//  BankingClone
//
//  Created by Macpro M2    on 14/3/26.
//

import SwiftUI

struct TransactionDetailView: View {
    
    let transaction: Transaction
    
    var body: some View {
        Form {
            Section {
                
                Label("\(Int(transaction.amount))", systemImage: transaction.type == .expense ? "arrow.down.left": "arrow.up.right")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(transaction.type == .expense ? .red : .green)
                    
                    .frame(maxWidth: .infinity,alignment: .center)

            }
            HStack {
                Text("Nội dung:")
                    .foregroundStyle(Color(.secondaryLabel))
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text(transaction.description)
                    
            }
            
            HStack {
                Text(transaction.type == .expense ? "Thời gian chuyển: " : "Thời gian nhận:")
                    .foregroundStyle(.secondary)
                Spacer()
                Text(transaction.date.formatted(date: .abbreviated, time: .shortened))
            }
            
            HStack {
                Text("Mã giao dịch: ")
                    .foregroundStyle(Color(.secondaryLabel))
                Spacer()
                Text("\(transaction.id)")
            }
            
            Section {
                Button {
                    UIPasteboard.general.string =
                    "TXN-\(transaction.id) \n\(Int(transaction.amount)) VND \n\(transaction.date.formatted(date: .abbreviated, time: .shortened)) \n\(transaction.description)"

                } label: {
                    Label("COPY THÔNG TIN GD", systemImage: "doc.on.clipboard")
                        .frame(maxWidth: .infinity,alignment: .init(horizontal: .center, vertical: .center))
                        .foregroundStyle(Color(.secondaryLabel))
                        .font(.title2)

                }
            }
            
        }
    }
}
#Preview {
    TransactionDetailView(transaction: Transaction(
        id: 1,
        amount: 200_000,
        type: .income,
        date: .now,
        description: "olisaudfghiho;íaehf;oiaSFHO;IAYHSFOIASHDFOIUSADHFOSAIDFYHOIasdfyh"
    ))
}
