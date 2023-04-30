//
//  ExpenseCategory.swift
//  Cashflow
//
//  Created by simge on 30.04.2023.
//

import Foundation

enum ExpenseCategory: String, CaseIterable, Codable, Equatable {
    case food = "Food"
    case market = "Market"
    case housing = "Housing"
    case entertainment = "Entertainment"
    
    var iconName: String {
        switch self {
        case .food:
            return "takeoutbag.and.cup.and.straw.fill"
        case .market:
            return "cart.fill"
        case .housing:
            return "house.fill"
        case .entertainment:
            return "gamecontroller.fill"
        }
    }
    
    var displayName: String {
        return self.rawValue
    }
}
