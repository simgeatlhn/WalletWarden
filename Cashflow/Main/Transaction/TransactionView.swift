//
//  TransactionView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var price: Double
}

let itemList = [
    Item(name: "Netflix", date:"Aug, 25, 22", price: 999.0),
    Item(name: "Spotify", date:"Aug, 25, 22", price: 799.0),
    Item(name: "Netflix", date:"Aug, 25, 22", price: 999.0),
    Item(name: "Spotify", date:"Aug, 25, 22", price: 799.0),
    Item(name: "Netflix", date:"Aug, 25, 22", price: 999.0),
]


struct TransactionView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Transaction")
                .fontWeight(.bold)
                .foregroundColor(blackColor)
                .font(.system(size: 20))
                .padding(.bottom, 4)
            
            ForEach(itemList) { item in
                HStack {
                    Image(systemName: "paperplane")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(blackColor)
                        .cornerRadius(8)
                        .padding(.bottom, 2)
                    
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                            .padding(.bottom, 2)
                        Text(item.date)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                    }
                    HStack {
                        Text("$")
                            .font(.subheadline)
                        Text(String(format: "%.2f", item.price))
                            .font(.subheadline)
                    }
                    .frame(width: 250, alignment: .trailing)
                }
            }
        }
        .padding(.top, 16)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}


