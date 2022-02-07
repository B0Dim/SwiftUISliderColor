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
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("100", text: $textValue) { _ in
            withAnimation {
                checkNewValue()
            }
        }
        .keyboardType(.decimalPad)
        .frame(width: 50, alignment: .leading)
        .textFieldStyle(.roundedBorder)
        .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
            Text("Please enter value from 0 to 255")
        }
    }
    
    private func checkNewValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textValue: .constant("150"), value: .constant(150))
    }
}
