//
//  ExpenseView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct ExpenseView: View {
    
    @State private var textInput = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Add an expense")
                .fontWeight(.bold)
                .foregroundColor(blackColor)
                .font(.system(size: 20))
                .padding(.all, 8)
            
            Text("Expense type:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.all, 8)
            
            TextField("your expense type", text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all, 8)
            
            Text("Expense amount:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.all, 8)
            
            TextField("your expense amount", text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.all, 8)
            
            Button(action: {
                // action
            }) {
                HStack {
                    Text("Save your expense")
                        .foregroundColor(blackColor)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 60)
                        .background(backgroundButtonColor)
                        .cornerRadius(8)
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding(.trailing, 8)
                    
                }
                .background(backgroundButtonColor)
                .cornerRadius(8)
                .padding(.horizontal, 24)
                .padding(.top, 12)
            }
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
