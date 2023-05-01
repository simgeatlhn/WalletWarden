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
    @State private var inputString = ""
    @State private var title: String = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var walletViewModel: WalletViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            TextField("Enter income title", text: $title)
                .font(.system(size: 20))
                .frame(width: 300, height: 60)
                .background(greenColor.opacity(0.2))
                .cornerRadius(8)
            
            TextField("Enter income amount", text: $inputString)
                .font(.system(size: 20))
                .frame(width: 300, height: 60)
                .background(greenColor.opacity(0.2))
                .cornerRadius(8)
                .disabled(true)
            
            VStack(spacing: 8) {
                ForEach(0..<3) { rowIndex in
                    HStack(spacing: 8) {
                        ForEach(1..<4) { colIndex in
                            let number = rowIndex * 3 + colIndex
                            Button(action: {
                                inputString.append("\(number)")
                            }) {
                                Text("\(number)")
                                    .font(.system(size: 24))
                                    .frame(width: 64, height: 64)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
                
                HStack(spacing: 8) {
                    Button(action: {
                        inputString.append("0")
                    }) {
                        Text("0")
                            .font(.system(size: 24))
                            .frame(width: 64, height: 64)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        if !inputString.isEmpty {
                            inputString.removeLast()
                        }
                    }) {
                        Image(systemName: "delete.left")
                            .font(.system(size: 24))
                            .frame(width: 64, height: 64)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            
            Button(action: {
                if title.isEmpty || inputString.isEmpty {
                    showAlert = true
                } else {
                    if let newIncome = Double(inputString) {
                        if let currentBalanceValue = Double(newBalance.dropFirst()) {
                            let updatedBalance = currentBalanceValue + newIncome
                            newBalance = "$\(updatedBalance)"
                            UserDefaults.saveBalance(newBalance)
                            
                            // Add the income transaction
                            walletViewModel.addIncome(title: title, amount: newIncome, date: Date(), category: ExpenseCategory.food)
                        }
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("OK")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(greenColor)
                    .foregroundColor(blackColor)
                    .cornerRadius(8)
            }
            
            .padding(.top)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Incomplete Fields"),
                message: Text("Please enter both title and income amount."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}



struct BalanceInputView_Previews: PreviewProvider {
    @State static private var sampleBalance = "$0"
    @StateObject static private var walletViewModel = WalletViewModel()
    
    static var previews: some View {
        BalanceInputView(newBalance: $sampleBalance, walletViewModel: walletViewModel)
            .environmentObject(walletViewModel)
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
