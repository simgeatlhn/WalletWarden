//
//  ContentView.swift
//  Cashflow
//
//  Created by simge on 17.04.2023.
//

import SwiftUI

struct ContentView: View {
    var userName = "Hello, Simge"
    @ObservedObject var walletViewModel = WalletViewModel()
    
    var body: some View {
        NavigationView {
            TabView() {
                HomeView()
                    .environmentObject(walletViewModel)
                    .tabItem {
                        NavigationLink(destination: HomeView()) {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }
                
                WalletView()
                    .environmentObject(walletViewModel)
                    .tabItem {
                        Image(systemName: "creditcard.fill")
                        Text("Wallet")
                    }
            }
            .accentColor(greenColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(userName)
                        .font(.system(size: 30, weight: .light, design: .default))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
