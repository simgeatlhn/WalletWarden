//
//  WalletView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack (alignment: .leading) {
                CardView()
                    .padding(.leading, 6)
                ExpenseView()
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
