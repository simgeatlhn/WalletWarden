//
//  WalletViewModel.swift
//  Cashflow
//
//  Created by simge on 25.04.2023.
//


import SwiftUI

struct Expense: Identifiable, Codable {
    let id: UUID
    let title: String
    let amount: Double
    let date: Date
    let isIncome: Bool
    let category: ExpenseCategory
}


class WalletViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
    
    private static let expensesKey = "expenses"
    
    init() {
        loadExpenses()
    }
    func addExpense(expense: Expense) {
        expenses.append(expense)
        saveExpenses()
    }
    
    func addIncome(title: String, amount: Double, date: Date, category: ExpenseCategory) {
        let income = Expense(id: UUID(), title: title, amount: amount, date: date, isIncome: true, category: category)
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
    
    func getTotalAmountForCategory(category: ExpenseCategory, isIncome: Bool) -> String {
        let totalAmount = expenses
            .filter { $0.category == category && $0.isIncome == isIncome }
            .reduce(0) { $0 + $1.amount }
        return String(format: "$%.2f", totalAmount)
    }
    
    func clearTransactions() {
        expenses.removeAll()
        saveExpenses()
        UserDefaults.standard.removeObject(forKey: Self.expensesKey)
    }
    
    //Profile view
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
    
    //Home-Card View
    
    var totalIncomeAmount: Double {
        return expenses
            .filter { $0.isIncome }
            .reduce(0) { $0 + $1.amount }
    }
    
    var totalExpensesAmount: Double {
        return expenses
            .filter { !$0.isIncome }
            .reduce(0) { $0 + $1.amount }
    }
}
