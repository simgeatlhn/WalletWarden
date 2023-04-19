//
//  SplashScreen.swift
//  Cashflow
//
//  Created by simge on 19.04.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showHome = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
             
                VStack(alignment: .leading) {
                    Text("Manage Your")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Finance")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Wisely")
                        .foregroundColor(greenColor)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.bottom, 48)
                }
                .padding(.trailing, 72)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.showHome = true
                    }
                }) {
                    Text("Click to get started")
                        .foregroundColor(blackColor)
                        .fontWeight(.bold)
                        .frame(width: 280)
                        .padding()
                        .background(greenColor)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { _ in
                    withAnimation {
                        self.showHome = true
                    }
                }
        )
        .overlay(
            Group {
                if showHome {
                    ContentView()
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .opacity))
                }
            }
        )
    }
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
