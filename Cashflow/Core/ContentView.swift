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
        TabView() {
            NavigationView {
                VStack {
                    CustomToolbar(userName: userName)
                    Spacer()
                    HomeView()
                        .environmentObject(walletViewModel)
                }
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView {
                VStack {
                    CustomToolbar(userName: userName)
                    Spacer()
                    WalletView()
                        .environmentObject(walletViewModel)
                }
            }
            .tabItem {
                Image(systemName: "creditcard.fill")
                Text("Wallet")
            }
            
            NavigationView {
                VStack {
                    CustomToolbar(userName: userName)
                    Spacer()
                    ProfileView()
                        .environmentObject(walletViewModel)
                }
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
        .accentColor(greenColor)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
