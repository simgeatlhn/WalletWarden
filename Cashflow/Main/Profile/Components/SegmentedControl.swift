//
//  SegmentedControl.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.
//

import SwiftUI

struct SegmentedControl: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack(spacing: 16) {
            Picker("Type", selection: $selectedSegment) {
                Text("Expenses")
                    .tag(0)
                Text("Categories")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(10)
            
            if selectedSegment == 0 {
                ExpensesView()
            } else {
                CategoriesView()
            }
        }
        .padding(.horizontal, 50)
        
        Spacer()
        
    }
}


struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl()
    }
}
