//
//  ContentView.swift
//  SwiftUISliderColor
//
//  Created by  BoDim on 03.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.indigo
                    .ignoresSafeArea()
                VStack(spacing: 30) {
                    RectangleView(
                        redColor: red, greenColor: green, blueColor: blue
                    )
                        .padding(.top, 20)
                    VStack {
                        ColorSliderView(value: $red, color: .red)
                        ColorSliderView(value: $green, color: .green)
                        ColorSliderView(value: $blue, color: .blue)
                    }
                    .focused($isInputActive)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isInputActive = false
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
            }
//            .onTapGesture {
//                isInputActive = false
//            }
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

