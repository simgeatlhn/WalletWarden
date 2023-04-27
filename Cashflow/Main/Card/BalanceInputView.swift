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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    Text("Simge Atlıhan")
                        .font(.system(size: 24))
                        .padding(.top, 8)
                }
                
                Divider()
                    .background(Color.gray)
            }
            .padding(.bottom)
            
            ZStack(alignment: .leading) {
                if inputString.isEmpty {
                    Text("Enter incomes")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20))
                        .padding(.leading, 8)
                }
                
                TextField("", text: $inputString)
                    .font(.system(size: 20))
                    .frame(width: 200, height: 60)
                    .background(greenColor.opacity(0.2))
                    .cornerRadius(8)
                    .disabled(true)
            }
            
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
                                    .background(blackColor)
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
                            .background(blackColor)
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
                            .background(blackColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            
            Button(action: {
                if let newIncome = Double(inputString) {
                    if let currentBalanceValue = Double(newBalance.dropFirst()) {
                        let updatedBalance = currentBalanceValue + newIncome
                        newBalance = "$\(updatedBalance)"
                        UserDefaults.saveBalance(newBalance)
                    }
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
            .padding(.top)
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
