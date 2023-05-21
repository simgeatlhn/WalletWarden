//
//  ExpensesView.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.
//

import SwiftUI

struct ExpensesView: View {
    @ObservedObject var walletViewModel: WalletViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image(systemName: "arrow.down.left.circle")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    Text("Incomes")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text(walletViewModel.totalIncome)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(width: 180, height: 120)
                .background(blackColor)
                .cornerRadius(16)
                .shadow(color: Color.primary.opacity(0.4), radius: 10, x: 0, y: 10)
                
                VStack {
                    Image(systemName: "arrow.up.forward.circle")
                        .font(.system(size: 24))
                        .foregroundColor(blackColor)
                    Text("Expenses")
                        .font(.subheadline)
                        .foregroundColor(blackColor)
                    Text(walletViewModel.totalExpenses)
                        .fontWeight(.bold)
                        .foregroundColor(blackColor)
                }
                .frame(width: 180, height: 120)
                .background(greenColor)
                .cornerRadius(16)
                .shadow(color: Color.primary.opacity(0.4), radius: 10, x: 0, y: 10)
            }
            .padding(.bottom, 16)
            
            Text("You can see the percentage of your total expenses compared to your income in the circular slider.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 8)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}




struct ExpensesView_Previews: PreviewProvider {
    static private var walletViewModelPreview = WalletViewModel()
    
    static var previews: some View {
        ExpensesView(walletViewModel: walletViewModelPreview)
    }
}


