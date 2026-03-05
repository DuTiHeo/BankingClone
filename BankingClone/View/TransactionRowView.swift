import SwiftUI

struct TransactionRowView: View {
    let transaction: Transaction

    var body: some View {
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
}

#Preview {
    TransactionRowView(
        transaction: Transaction(
            id: 1,
            amount: 200_000,
            type: .income,
            date: .now,
            description: "Sample"
        )
    )
}
