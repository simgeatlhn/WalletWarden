//
//  BalanceInputView.swift
//  Cashflow
//
//  Created by simge on 25.04.2023.
//

import SwiftUI

struct BalanceInputView: View {
    @Binding var newBalance: String
    @State private var incomeValue = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Enter your incomes")
                .font(.headline)
                .padding(.bottom)
                .foregroundColor(blackColor)
            
            TextField("Enter income amount", text: $incomeValue)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Button(action: {
                if let currentBalanceValue = Double(newBalance.dropFirst()), let newIncome = Double(incomeValue) {
                    let updatedBalance = currentBalanceValue + newIncome
                    newBalance = "$\(updatedBalance)"
                    UserDefaults.saveBalance(newBalance)
                }
                dismiss()
            }) {
                Text("OK")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(greenColor)
                    .foregroundColor(blackColor)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}


struct BalanceInputView_Previews: PreviewProvider {
    @State static private var sampleBalance = "$0"
    
    static var previews: some View {
        BalanceInputView(newBalance: $sampleBalance)
    }
}

extension UserDefaults {
    private static let balanceKey = "balance"
    
    static func saveBalance(_ balance: String) {
        UserDefaults.standard.set(balance, forKey: balanceKey)
    }
    
    static func getSavedBalance() -> String? {
        return UserDefaults.standard.string(forKey: balanceKey)
    }
}
