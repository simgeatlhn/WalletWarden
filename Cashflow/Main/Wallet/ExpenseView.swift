//
//  ExpenseView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

enum ExpenseCategory: String, CaseIterable, Codable, Equatable {
    case food = "Food"
    case market = "Market"
    case housing = "Housing"
    case entertainment = "Entertainment"
    
    var iconName: String {
        switch self {
        case .food:
            return "takeoutbag.and.cup.and.straw.fill"
        case .market:
            return "cart.fill"
        case .housing:
            return "house.fill"
        case .entertainment:
            return "gamecontroller.fill"
        }
    }
    
    var displayName: String {
        return self.rawValue
    }
}

struct ExpenseView: View {
    
    @State private var expenseType = ""
    @State private var expenseAmount = ""
    @ObservedObject var walletViewModel: WalletViewModel
    @State private var selectedExpenseCategory = ExpenseCategory.food
    @State private var showAlert = false
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Add an expense")
                .fontWeight(.bold)
                .foregroundColor(blackColor)
                .font(.system(size: 20))
                .padding(.all, 8)
            
            // Expense type
            Text("Expense type:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.all, 8)
            
            TextField("Enter your expense type", text: $expenseType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 40) // Set a fixed height
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            
            // Expense amount
            Text("Expense amount:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.all, 8)
            
            TextField("Enter your expense amount", text: $expenseAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 40) // Set a fixed height
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            
            // Expense category
            Text("Expense category:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.all, 8)
            
            Picker(selection: $selectedExpenseCategory, label: Text("Select").fontWeight(.bold)) {
                ForEach(ExpenseCategory.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .tag(category)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.all, 8)
            
            Spacer()
            
            // Save expense button
            Button(action: {
                if expenseType.isEmpty || expenseAmount.isEmpty {
                    showAlert = true
                } else {
                    if let amount = Double(expenseAmount) {
                        let newExpense = Expense(id: UUID(), title: expenseType, amount: amount, date: Date(), isIncome: false, category: selectedExpenseCategory)
                        walletViewModel.addExpense(expense: newExpense)
                        expenseType = ""
                        expenseAmount = ""
                    }
                }
            }) {
                HStack {
                    Text("Save your expense")
                        .foregroundColor(blackColor)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 60)
                        .background(backgroundButtonColor)
                        .cornerRadius(8)
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                    
                }
                .background(backgroundButtonColor)
                .cornerRadius(8)
                .padding(.horizontal, 16)
                .padding(.top, 12)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Incomplete Fields"),
                    message: Text("Please enter both expense type and amount."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}


struct ExpenseView_Previews: PreviewProvider {
    @StateObject static private var walletViewModel = WalletViewModel()
    
    static var previews: some View {
        ExpenseView(walletViewModel: walletViewModel)
    }
}

