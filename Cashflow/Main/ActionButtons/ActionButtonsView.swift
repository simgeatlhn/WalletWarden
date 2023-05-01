//
//  ActionButtonsView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI

struct ActionButtonsView: View {
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center) {
                Image(systemName: "plus")
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                Spacer().frame(height: 11)
                Text("Add Money")
                    .font(.system(size: 16))
                    .foregroundColor(blackColor)
            }
            .frame(width: 110, height: 110)
            .background(purpleColor)
            .cornerRadius(16)
            
            Spacer()
            
            VStack(alignment: .center) {
                Image(systemName: "arrow.left.arrow.right")
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                Spacer().frame(height: 4)
                Text("Expenses")
                    .font(.system(size: 16))
                    .foregroundColor(blackColor)
            }
            .frame(width: 110, height: 110)
            .background(orangeColor)
            .cornerRadius(16)
            
            Spacer()
            
            VStack(alignment: .center) {
                Image(systemName: "square.and.arrow.down")
                    .font(.system(size: 32))
                    .foregroundColor(.black)
                Spacer().frame(height: 4)
                Text("Categories")
                    .font(.system(size: 16))
                    .foregroundColor(blackColor)
            }
            .frame(width: 108, height: 108)
            .background(blueColor)
            .cornerRadius(16)
            
            Spacer()
        }
        .padding(.top, 8)
    }
}




struct ActionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonsView()
    }
}
