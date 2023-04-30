//
//  CustomToolBar.swift
//  Cashflow
//
//  Created by simge on 30.04.2023.
//

import SwiftUI

struct CustomToolbar: View {
    let userName: String
    
    var body: some View {
        HStack {
            Text(userName)
                .font(.system(size: 30, weight: .light, design: .default))
                .padding(.leading)
            
            Spacer()
            
            Image(systemName: "bell")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing)
        }
    }
}

struct CustomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomToolbar(userName: "Simge")
    }
}
