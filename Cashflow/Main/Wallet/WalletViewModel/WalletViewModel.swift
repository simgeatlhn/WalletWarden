//
//  WalletViewModel.swift
//  Cashflow
//
//  Created by simge on 25.04.2023.
//


import SwiftUI

struct Expense: Identifiable, Codable{
    let id: UUID
    let title: String
    let amount: Double
    let date: Date
    let isIncome: Bool
}

class WalletViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    
    private static let expensesKey = "expenses"
    
    init() {
        loadExpenses()
    }
    
    func addExpense(title: String, amount: Double, date: Date) {
        let expense = Expense(id: UUID(), title: title, amount: amount, date: date, isIncome: false)
        expenses.append(expense)
        saveExpenses()
    }
    
    func addIncome(title: String, amount: Double, date: Date) {
        let income = Expense(id: UUID(), title: title, amount: amount, date: date, isIncome: true)
        expenses.append(income)
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
    
    var totalIncome: String {
        let incomeSum = expenses
            .filter { $0.isIncome }
            .reduce(0) { $0 + $1.amount }
        return "$\(incomeSum)"
    }
    
    var totalExpenses: String {
        let expensesSum = expenses
            .filter { !$0.isIncome }
            .reduce(0) { $0 + $1.amount }
        return "$\(expensesSum)"
    }
}
