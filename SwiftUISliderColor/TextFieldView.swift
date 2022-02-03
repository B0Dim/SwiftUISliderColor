//
//  TextFieldView.swift
//  SwiftUISliderColor
//
//  Created by  BoDim on 03.02.2022.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    var body: some View {
        TextField("100", text: $textValue)
            .onChange(of: textValue) { newValue in
                checkNewValue(newValue)
            }
            .keyboardType(.decimalPad)
            .frame(width: 50, alignment: .leading)
            .textFieldStyle(.roundedBorder)
    }
    
    private func checkNewValue(_ newValue: String) {
        guard let value = Int(newValue) else {
            self.value = 0
            textValue = "0"
            return
        }
        if value <= 0 {
            self.value = 0
        } else if value > 255 {
            self.value = 255
        } else {
            self.value = Double(value)
        }
        textValue = String(lround(self.value))
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textValue: .constant("150"), value: .constant(150))
    }
}
