//
//  ContentView.swift
//  Cashflow
//
//  Created by simge on 17.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var newName = ""
    @StateObject private var userNameManager = UserNameManager()
    @StateObject private var walletViewModel = WalletViewModel()
    
    var body: some View {
        ZStack {
            TabView() {
                NavigationView {
                    VStack {
                        CustomToolbar(userName: $userNameManager.userName) {
                            showingAlert = true
                        }
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
                        CustomToolbar(userName: $userNameManager.userName) {
                            showingAlert = true
                        }
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
                        CustomToolbar(userName: $userNameManager.userName) {
                            showingAlert = true
                        }
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
            
            if showingAlert {
                CustomAlert(isPresented: $showingAlert, text: $newName, title: "Enter your name", message: "Please enter your name to update the username.", placeholder: "Name") {
                    if !newName.isEmpty {
                        userNameManager.userName = newName
                        UserDefaults.standard.set(newName, forKey: "userName") // Save the new user's name
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
