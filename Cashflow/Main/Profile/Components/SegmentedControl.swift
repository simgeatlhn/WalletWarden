//
//  SegmentedControl.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.
//

import SwiftUI

struct SegmentedControl: View {
    @State private var selectedSegment = 0
    @Binding var newBalance: String
    var walletViewModel: WalletViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Picker("Type", selection: $selectedSegment) {
                Text("Expenses")
                    .tag(0)
                Text("Categories")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(10)
            
            if selectedSegment == 0 {
                ExpensesView(walletViewModel: walletViewModel)
            } else {
                CategoriesView()
            }
        }
        .padding(.horizontal, 50)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
        
        Spacer()
    }
}



struct SegmentedControl_Previews: PreviewProvider {
    @State static private var newBalancePreview = "$0"
    static private var walletViewModelPreview = WalletViewModel()
    
    static var previews: some View {
        SegmentedControl(newBalance: $newBalancePreview, walletViewModel: walletViewModelPreview)
        
    }
}

