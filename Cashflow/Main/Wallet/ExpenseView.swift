//
//  ExpenseView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct ExpenseView: View {
    @State private var expenseType = ""
    @State private var expenseAmount = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @ObservedObject var walletViewModel: WalletViewModel
    @State private var selectedExpenseCategory = ExpenseCategory.food
    
    //Alert message
    private func isAmountValid() -> Bool {
        if let _ = Double(expenseAmount) {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Add an expense")
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .font(.system(size: 20))
                .padding(.all, 8)
            
            // Expense type
            Text("Expense title:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.all, 8)
            
            TextField("Enter your expense title", text: $expenseType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
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
                .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
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
                    alertMessage = "Please enter both expense type and amount."
                } else if !isAmountValid() {
                    showAlert = true
                    alertMessage = "Please enter a valid numerical value for the expense amount."
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
                    Spacer()
                    
                    Text("Save your expense")
                        .foregroundColor(blackColor)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(backgroundButtonColor)
                        .cornerRadius(8)
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                    
                    Spacer()
                }
                .background(backgroundButtonColor)
                .cornerRadius(8)
                .padding(.horizontal, 16)
                .padding(.top, 12)
            }
            
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid Input"),
                    message: Text(alertMessage),
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

