//
//  SkeletonRowView.swift
//  BankingClone
//
//  Created by Macpro M2    on 17/3/26.
//
import SwiftUI

struct SkeletonRowView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 140, height: 12)
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 90, height: 10)
            }
            Spacer()
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 70, height: 12)
        }
        .foregroundStyle(.gray.opacity(0.3))
    }
}
