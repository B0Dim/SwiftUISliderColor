//
//  ColorSliderView.swift
//  SwiftUISliderColor
//
//  Created by  BoDim on 03.02.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var textValue = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(color)
                .frame(width: 35)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: value) { newValue in
                    textValue = String(lround(newValue))
                }
            TextFieldView(textValue: $textValue, value: $value)
            
        }
        .onAppear {
            textValue = "\(lround(value))"
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(150), color: .red)
    }
}
