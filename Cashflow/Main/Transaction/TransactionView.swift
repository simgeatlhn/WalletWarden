//
//  TransactionView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct TransactionView: View {
    @EnvironmentObject var walletViewModel: WalletViewModel
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Transaction")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .font(.system(size: 20))
                    .padding(.bottom, 4)
                    .padding(.leading, 16)
                
                Spacer()
                
                Button(action: {
                    walletViewModel.clearTransactions()
                }) {
                    Text("clear all")
                        .foregroundColor(.gray)
                        .padding(.trailing, 16)
                }
            }
            
            ForEach(walletViewModel.expenses) { expense in
                HStack {
                    Image(systemName: expense.isIncome ? "arrow.down.left.circle.fill" : (ExpenseCategory(rawValue: expense.category.rawValue)?.iconName ?? "defaultIcon"))
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(blackColor)
                        .cornerRadius(8)
                        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 10)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(expense.title)
                            .font(.headline)
                        Text("\(expense.date, formatter: dateFormatter)")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Text("$")
                            .font(.system(size: 14))
                        Text(String(format: "%.2f", expense.amount))
                            .font(.system(size: 14))
                            .foregroundColor(expense.isIncome ? .green : .red)
                            .fontWeight(.bold)
                    }
                }
                .padding([.leading, .trailing], 8) // updated
            }
        }
        .padding(.top, 16)
    }
}


struct TransactionView_Previews: PreviewProvider {
    @ObservedObject static private var walletViewModel = WalletViewModel()
    
    static var previews: some View {
        WalletView()
            .environmentObject(walletViewModel)
    }
}
