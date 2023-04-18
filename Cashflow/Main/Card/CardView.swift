//
//  CardView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(blackColor)
                .frame(width: 360, height: 180)
                .cornerRadius(16)
            
            VStack (alignment: .leading) {
                Text("Your balance")
                    .foregroundColor(.white)
                Text("$3,460,348")
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Button(action: {
                    // action
                }) {
                    Text("$670 - 2%")
                        .foregroundColor(blackColor)
                        .fontWeight(.bold)
                        .frame(width: 90, height: 10)
                        .padding()
                        .background(greenColor)
                        .cornerRadius(8)
                }
            }
            .padding(.trailing, 100)
        }
        .padding(.top, 24)
        .padding(.leading, 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
