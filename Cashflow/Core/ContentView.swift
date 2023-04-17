//
//  ContentView.swift
//  Cashflow
//
//  Created by simge on 17.04.2023.
//

import SwiftUI

struct ContentView: View {
    var userName = "Hello, Simge"
    
    var body: some View {
        NavigationView {
            TabView {
                Text("Home")
                    .tabItem {
                        Image(systemName: "homekit")
                        Text("Home")
                    }
                Text("Wallet")
                    .tabItem {
                        Image(systemName: "folder")
                        Text("Profile")
                    }
                Text("Profile")
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
            .navigationBarTitle(Text(userName), displayMode: .large)
            .navigationBarItems(trailing:
                                    HStack {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 20, height: 20)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
