//
//  HomeView.swift
//  Cashflow
//
//  Created by simge on 17.04.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                CardView()
                
                ActionButtonsView()
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
