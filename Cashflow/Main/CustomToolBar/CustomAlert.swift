//
//  CustomAlert.swift
//  Cashflow
//
//  Created by simge on 30.04.2023.
//

import SwiftUI


struct CustomAlert: View {
    @Binding var isPresented: Bool
    @Binding var text: String
    
    let title: String
    let message: String
    let placeholder: String
    let onCommit: () -> Void
    
    var body: some View {
        ZStack {
            blackColor.opacity(isPresented ? 0.4 : 0)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(message)
                    .font(.body)
                    .foregroundColor(.primary)
                TextField(placeholder, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 30)
                    .foregroundColor(.primary)
                Button("OK") {
                    onCommit()
                    isPresented = false
                }
                .padding()
                .foregroundColor(blackColor)
                .background(greenColor)
                .cornerRadius(8)
            }
            .frame(width: 300)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
            .opacity(isPresented ? 1 : 0)
        }
    }
}



struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(isPresented: .constant(true), text: .constant(""), title: "Sample Title", message: "Sample message", placeholder: "Sample placeholder", onCommit: {})
    }
}

