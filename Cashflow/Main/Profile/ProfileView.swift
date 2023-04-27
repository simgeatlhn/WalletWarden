//
//  ProfileView.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            CircularSlider()
                .padding(.top,24)
            SegmentedControl()
                .padding(.top,50)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
