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
    
    @EnvironmentObject var walletViewModel: WalletViewModel
    
    private var currentBalance: String {
        let balance = walletViewModel.totalIncomeAmount - walletViewModel.totalExpensesAmount
        return String(format: "$%.2f", balance)
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(blackColor)
                        .frame(width: 360, height: 180)
                        .cornerRadius(16)
                        .shadow(color: Color.primary.opacity(0.4), radius: 5)
                    
                    VStack (alignment: .leading) {
                        Text("Your balance")
                            .foregroundColor(.white)
                            .padding(.trailing,160)
                        Text(currentBalance)
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
                    .padding(.trailing, 12)
                    .padding(.top, 24)
                    .padding(.leading, 12)
                }
                
                Spacer()
            }
            
            Spacer()
            
        }
        
        .sheet(isPresented: $isShowingSheet, onDismiss: {
            if let savedBalance = UserDefaults.getSavedBalance() {
                newBalance = savedBalance
            }
        }) {
            BalanceInputView(newBalance: $newBalance, walletViewModel: walletViewModel)
        }
        .onAppear {
            if let savedBalance = UserDefaults.getSavedBalance() {
                newBalance = savedBalance
            }
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
