//
//  CustomToolBar.swift
//  Cashflow
//
//  Created by simge on 30.04.2023.
//

import SwiftUI

struct CustomToolbar: View {
    @Binding var userName: String
    let onHighlighterTapped: () -> Void
    
    var body: some View {
        HStack {
            Text("Hello, \(userName)")
                .font(.system(size: 30, weight: .light, design: .default))
                .padding(.leading)
            
            Spacer()
            
            Button(action: {
                onHighlighterTapped()
            }) {
                Image(systemName: "highlighter")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                    .foregroundColor(blackColor)
            }
        }
    }
}



struct CustomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomToolbar(userName: .constant("Simge"), onHighlighterTapped: {})
    }
}

