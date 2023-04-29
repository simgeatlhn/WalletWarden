//
//  HomeView.swift
//  Cashflow
//
//  Created by simge on 17.04.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var walletViewModel: WalletViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView (showsIndicators: false) {
                VStack (alignment: .leading) {
                    CardView()
                    ActionButtonsView()
                    TransactionView()
                }
                .padding(.horizontal, geometry.size.width * 0.025)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

