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
            .background(Color.black)
            .cornerRadius(16)
            
            VStack {
                Image(systemName: "arrow.up.forward.circle")
                    .font(.system(size: 24))
                    .foregroundColor(blackColor)
                Text("Expenses")
                    .font(.subheadline)
                    .foregroundColor(blackColor)
                Text(walletViewModel.totalExpenses) // Toplam harcamaları burada kullanın
                    .fontWeight(.bold)
                    .foregroundColor(blackColor)
            }
            .frame(width: 180, height: 120)
            .background(greenColor)
            .cornerRadius(16)
        }
    }
}




struct ExpensesView_Previews: PreviewProvider {
    static private var walletViewModelPreview = WalletViewModel()
    
    static var previews: some View {
        ExpensesView(walletViewModel: walletViewModelPreview)
    }
}


