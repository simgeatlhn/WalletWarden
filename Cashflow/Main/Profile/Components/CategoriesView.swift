//
//  CategoriesView.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject var walletViewModel: WalletViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                createCategoryView(imageName: "gamecontroller", category: .entertainment, backgroundColor: blackColor, foregroundColor: .white)
                createCategoryView(imageName: "cart", category: .market, backgroundColor: greenColor, foregroundColor: blackColor)
            }
            
            HStack(spacing: 16) {
                createCategoryView(imageName: "takeoutbag.and.cup.and.straw", category: .food, backgroundColor: greenColor, foregroundColor: blackColor)
                createCategoryView(imageName: "house", category: .housing, backgroundColor: blackColor, foregroundColor: .white)
            }
        }
        
    }
    
    func createCategoryView(imageName: String, category: ExpenseCategory, backgroundColor: Color, foregroundColor: Color) -> some View {
        let amount = walletViewModel.getTotalAmountForCategory(category: category, isIncome: false)
        
        return VStack {
            Image(systemName: imageName)
                .font(.system(size: 24))
                .foregroundColor(foregroundColor)
            Text(category.displayName)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(foregroundColor)
            Text(amount)
                .fontWeight(.bold)
                .foregroundColor(foregroundColor)
        }
        .frame(width: 160, height: 120)
        .background(backgroundColor)
        .cornerRadius(16)
    }
}



struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
