//
//  CardView.swift
//  Cashflow
//
//  Created by simge on 18.04.2023.
//

import SwiftUI
struct CardView: View {
    @State private var buttonWidth: CGFloat = 90
    @State private var isShowingSheet = false
    @State private var newBalance = "$0"
    @State private var isOKButtonDisabled = true
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(blackColor)
                .frame(width: 360, height: 180)
                .cornerRadius(16)
            
            VStack (alignment: .leading) {
                Text("Your balance")
                    .foregroundColor(.white)
                Text(newBalance)
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Button(action: {
                    isShowingSheet = true
                    
                }) {
                    Text("Enter Incomes")
                        .foregroundColor(blackColor)
                        .fontWeight(.bold)
                        .frame(width: buttonWidth, height: 10)
                        .padding()
                        .background(greenColor)
                        .cornerRadius(8)
                }
                .onAppear {
                    let string = "Enter Incomes"
                    let size = string.size(withAttributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
                    buttonWidth = size.width + 20
                }
            }
            .padding(.trailing, 100)
        }
        .padding(.top, 24)
        .padding(.leading, 8)
        .sheet(isPresented: $isShowingSheet) {
                  BalanceInputView(newBalance: $newBalance)
              }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
