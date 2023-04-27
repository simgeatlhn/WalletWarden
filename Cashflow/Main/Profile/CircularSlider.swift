//
//  CircularSlider.swift
//  Cashflow
//
//  Created by simge on 27.04.2023.
//

import SwiftUI

struct CircularSlider: View {
    @State private var sliderValue: Double = 0.5
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(blackColor, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                    .frame(width: 200, height: 200)
                
                ThumbSlider(value: $sliderValue)
                    .frame(width: 200, height: 200)
                
                VStack {
                    Text("Total")
                        .fontWeight(.bold)
                        .foregroundColor(blackColor)
                        .font(.headline)
                    
                    Text("$500")
                        .fontWeight(.bold)
                        .foregroundColor(blackColor)
                        .font(.headline)
                }
            }
        }
    }
}

struct ThumbSlider: View {
    @Binding var value: Double
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(value))
                .stroke(greenColor, lineWidth: 10)
                .frame(width: 200, height: 200)
        }
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged { value in
                let vector = CGVector(dx: value.location.x, dy: value.location.y)
                let radians = atan2(vector.dy - 100, vector.dx - 100)
                var angle = radians * 180 / .pi
                if angle < 0 {
                    angle += 360
                }
                self.value = Double(angle / 360)
            }
        )
    }
}

struct CircularSlider_Previews: PreviewProvider {
    static var previews: some View {
        CircularSlider()
    }
}
