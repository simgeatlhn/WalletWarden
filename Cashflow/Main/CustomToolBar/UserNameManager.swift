//
//  UserNameManager.swift
//  Cashflow
//
//  Created by simge on 30.04.2023.
//

import Foundation

class UserNameManager: ObservableObject {
    @Published var userName: String
    
    init() {
        userName = UserDefaults.standard.string(forKey: "userName") ?? "username"
    }
    
    func saveUserName(newName: String) {
        userName = newName
        UserDefaults.standard.set(newName, forKey: "userName")
    }
}

