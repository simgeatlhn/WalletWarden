//
//  ProfileView.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.

import SwiftUI

struct ProfileView: View {
    @State private var newBalance = "$0"
    @ObservedObject private var walletViewModel = WalletViewModel()
    
    var body: some View {
        VStack {
            CircularSlider()
                .padding(.top,24)
            SegmentedControl(newBalance:  $newBalance, walletViewModel: walletViewModel)
                .padding(.top,50)
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
