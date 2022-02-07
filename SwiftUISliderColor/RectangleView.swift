//
//  RectangleView.swift
//  SwiftUISliderColor
//
//  Created by  BoDim on 03.02.2022.
//

import SwiftUI

struct RectangleView: View {
    let redColor: Double
    let greenColor: Double
    let blueColor: Double

    
    var body: some View {
        Color(red: redColor / 255,
                  green: greenColor / 255,
                  blue: blueColor / 255)
            .frame(height: 170)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(redColor: 100, greenColor: 10, blueColor: 50)
    }
}
