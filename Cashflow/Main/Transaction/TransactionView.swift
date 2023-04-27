//
//  TransactionView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct TransactionView: View {
    @ObservedObject var walletViewModel: WalletViewModel
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Transaction")
                .fontWeight(.bold)
                .foregroundColor(blackColor)
                .font(.system(size: 20))
                .padding(.bottom, 4)
            
            ForEach(walletViewModel.expenses) { expense in
                HStack {
                    Image(systemName: "paperplane")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(blackColor)
                        .cornerRadius(8)
                        .padding(.bottom, 2)
                    
                    VStack(alignment: .leading) {
                        Text(expense.title)
                            .font(.headline)
                            .padding(.bottom, 2)
                        Text("\(expense.date, formatter: dateFormatter)")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                    }
                    HStack {
                        Text("$")
                            .font(.subheadline)
                        Text(String(format: "%.2f", expense.amount))
                            .font(.subheadline)
                            .foregroundColor(expense.isIncome ? .green : .black)
                    }
                    .frame(width: 250, alignment: .trailing)
                }
            }
        }
        .padding(.top, 16)
    }
}


struct TransactionView_Previews: PreviewProvider {
    @StateObject static private var walletViewModel = WalletViewModel()
    
    static var previews: some View {
        TransactionView(walletViewModel: walletViewModel)
    }
}
