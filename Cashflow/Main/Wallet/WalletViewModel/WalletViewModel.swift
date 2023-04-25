//
//  WalletViewModel.swift
//  Cashflow
//
//  Created by simge on 25.04.2023.
//


import SwiftUI

struct Expense: Identifiable, Codable {
    var id = UUID()
    var title: String
    var amount: Double
    var date: Date
}

class WalletViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    
    private static let expensesKey = "expenses"
    
    init() {
        loadExpenses()
    }
    
    func addExpense(title: String, amount: Double, date: Date) {
        let expense = Expense(title: title, amount: amount, date: date)
        expenses.append(expense)
        saveExpenses()
    }
    
    private func saveExpenses() {
        if let encodedData = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(encodedData, forKey: Self.expensesKey)
        }
    }
    
    private func loadExpenses() {
        if let data = UserDefaults.standard.data(forKey: Self.expensesKey),
           let decodedData = try? JSONDecoder().decode([Expense].self, from: data) {
            expenses = decodedData
        }
    }
}

