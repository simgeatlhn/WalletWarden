//
//  WalletView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct WalletView: View {
    @EnvironmentObject private var walletViewModel: WalletViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView (showsIndicators: false) {
                VStack (alignment: .leading) {
                    CardView()
                    Spacer(minLength: 16)
                    ExpenseView(walletViewModel: walletViewModel)
                }
            }
            .padding(.horizontal, geometry.size.width * 0.025)
        }
    }
}



struct WalletView_Previews: PreviewProvider {
    @StateObject static private var walletViewModel = WalletViewModel()
    
    static var previews: some View {
        WalletView()
            .environmentObject(walletViewModel)
    }
}

