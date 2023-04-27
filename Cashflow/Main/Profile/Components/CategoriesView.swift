//
//  CategoriesView.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                createCategoryView(imageName: "gamecontroller", category: "Entertainment", amount: "$100", backgroundColor: blackColor, foregroundColor: .white)
                createCategoryView(imageName: "cart", category: "Market", amount: "$50", backgroundColor: greenColor, foregroundColor: blackColor)
            }
            
            HStack(spacing: 16) {
                createCategoryView(imageName: "takeoutbag.and.cup.and.straw", category: "Food", amount: "$200", backgroundColor: greenColor, foregroundColor: blackColor)
                createCategoryView(imageName: "house", category: "Housing", amount: "$150", backgroundColor: blackColor, foregroundColor: .white)
            }
        }
    }
    
    func createCategoryView(imageName: String, category: String, amount: String, backgroundColor: Color, foregroundColor: Color) -> some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 24))
                .foregroundColor(foregroundColor)
            Text(category)
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
