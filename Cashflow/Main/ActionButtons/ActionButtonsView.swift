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
            Button(action: {
                // action for first button
            }) {
                VStack {
                    Image(systemName: "plus")
                        .font(.system(size: 32))
                        .foregroundColor(.black)
                        .padding(.bottom, 2)
                    Text("Add Money")
                        .font(.system(size: 16))
                        .foregroundColor(blackColor)
                }
                
                .frame(width: 110, height: 110)
                .background(purpleColor)
                .cornerRadius(16)
            }
            
            Button(action: {
                // action for first button
            }) {
                VStack {
                    Image(systemName: "arrow.left.arrow.right")
                        .font(.system(size: 32))
                        .foregroundColor(.black)
                        .padding(.bottom, 2)
                    Text("Trade")
                        .font(.system(size: 16))
                        .foregroundColor(blackColor)
                }
                
                .frame(width: 110, height: 110)
                .background(orangeColor)
                .cornerRadius(16)
            }
            
            Button(action: {
                // action for first button
            }) {
                VStack {
                    Image(systemName: "square.and.arrow.down")
                        .font(.system(size: 32))
                        .foregroundColor(.black)
                        .padding(.bottom, 2)
                    Text("Withdraw")
                        .font(.system(size: 16))
                        .foregroundColor(blackColor)
                }
                
                .frame(width: 108, height: 108)
                .background(blueColor)
                .cornerRadius(16)
            }
        }
        .padding(.top, 8)
        .padding(.horizontal, 16)
    }
}

struct ActionButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonsView()
    }
}
