//
//  MockData.swift
//  BankingClone
//
//  Created by Macpro M2    on 2026/03/03.
//

import Foundation
struct MockData {
    
    static let account = Account(
        id: 1,
        ownerName: "Duong Tien Haoo",
        balance: 19_999_987
    )
    
    static let transactions: [Transaction] = [
        Transaction(
            id: 1,
            amount: 2_000_000,
            type: .income,
            date: Date(),
            description: "Salary"
        ),
        Transaction(
            id: 2,
            amount: 150_000,
            type: .expense,
            date: Date(),
            description: "Coffee"
        ),
        Transaction(
            id: 3,
            amount: 500_000,
            type: .expense,
            date: Date(),
            description: "Shopping"
        ),
        Transaction(
            id: 4, 
            amount: 900_000,
            type: .income,
            date: Date(),
            description: "Tai Xiu"
        ),
        Transaction(
                    id: 5,
                    amount: 120_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                    description: "Ăn sáng & Phở"
                ),
                Transaction(
                    id: 6,
                    amount: 45_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                    description: "Gửi xe tháng"
                ),
                Transaction(
                    id: 7,
                    amount: 1_200_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
                    description: "Tiền điện nước"
                ),
                Transaction(
                    id: 8,
                    amount: 300_000,
                    type: .income,
                    date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
                    description: "Hoàn tiền Shopee"
                ),
                Transaction(
                    id: 9,
                    amount: 250_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
                    description: "Đăng ký Netflix"
                ),
                Transaction(
                    id: 10,
                    amount: 5_000_000,
                    type: .income,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
                    description: "Thưởng dự án"
                ),
                Transaction(
                    id: 11,
                    amount: 80_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
                    description: "GrabBike"
                ),
                Transaction(
                    id: 12,
                    amount: 150_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
                    description: "Mua sách mới"
                ),
                Transaction(
                    id: 13,
                    amount: 2_500_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
                    description: "Trả góp điện thoại"
                ),
                Transaction(
                    id: 14,
                    amount: 100_000,
                    type: .income,
                    date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
                    description: "Lãi tiết kiệm"
                ),
                Transaction(
                    id: 15,
                    amount: 600_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!,
                    description: "Đi chợ tuần"
                ),
                Transaction(
                    id: 16,
                    amount: 350_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!,
                    description: "Nhậu với bạn bè"
                ),
                Transaction(
                    id: 17,
                    amount: 20_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
                    description: "Bánh mì"
                ),
                Transaction(
                    id: 18,
                    amount: 1_000_000,
                    type: .income,
                    date: Calendar.current.date(byAdding: .day, value: -11, to: Date())!,
                    description: "Freelance Job"
                ),
                Transaction(
                    id: 19,
                    amount: 50_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -12, to: Date())!,
                    description: "Nạp thẻ điện thoại"
                ),
                Transaction(
                    id: 20,
                    amount: 200_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -13, to: Date())!,
                    description: "Cắt tóc"
                ),
                Transaction(
                    id: 21,
                    amount: 400_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -14, to: Date())!,
                    description: "Đổ xăng xe hơi"
                ),
                Transaction(
                    id: 22,
                    amount: 150_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -15, to: Date())!,
                    description: "Mua trà sữa"
                ),
                Transaction(
                    id: 23,
                    amount: 2_000_000,
                    type: .income,
                    date: Calendar.current.date(byAdding: .day, value: -16, to: Date())!,
                    description: "Bố mẹ gửi cho"
                ),
                Transaction(
                    id: 24,
                    amount: 120_000,
                    type: .expense,
                    date: Calendar.current.date(byAdding: .day, value: -17, to: Date())!,
                    description: "Mua đồ gia dụng"
                )
    ]
}
