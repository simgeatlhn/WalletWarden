//
//  WalletView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct WalletView: View {
    @StateObject private var walletViewModel = WalletViewModel()
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack (alignment: .leading) {
                CardView()
                    .padding(.leading, 6)
                ExpenseView(walletViewModel: walletViewModel)
            }
        }
    }
}


struct WalletView_Previews: PreviewProvider {
    @StateObject static private var walletViewModel = WalletViewModel()
    
    static var previews: some View {
        WalletView().environmentObject(walletViewModel)
    }
}

