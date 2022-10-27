//
//  ContentView.swift
//  ColourSelector
//
//  Created by Joyce Tao on 2022-10-27.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    @State private var selectedHue = 0.0
    
    // tracks the list of saved palettes
    @State private var savedPalettes: [SavedPalette] = []
    
    // MARK: Computed Properties
    
    // The selected hue expressed as a value between 0 and 1.0
    private var hue: Double {
        return selectedHue / 360.0
    }
    
    // Make the colour that SwiftUI will use to set the background of the colour swatch
    private var baseColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.9)
    }
    
    private var darkerColourOne: Color {
        return Color(hue: hue, saturation: 0.8, brightness: 0.6)
    }
    
    private var darkerColourTwo: Color {
        return Color(hue: hue, saturation: 0.8, brightness: 0.3)
    }
    
    //Interface
    var body: some View {
        VStack {
            
            VStack {}
                .frame(width: 200, height: 200)
                .background(baseColour)
            
            Text("Hue")
                .bold()
            
            Text("\(selectedHue.formatted(.number.precision(.fractionLength(1))))°")
            
            Slider(
                value: $selectedHue,
                in: 0...360,
                label: {
                    Text("Hue")
                },
                minimumValueLabel: {
                    Text("0")
                },
                maximumValueLabel: {
                    Text("360")
                })
            
            // title and colour patch with the base colour, and its two darker variations
            Group {
                HStack {
                    Text("MONOCHROMATIC")
                        .padding(.leading)
                    Spacer()
                }
                
                HStack (spacing: 0) {
                    Rectangle()
                        .foregroundColor(baseColour)
                        .frame(width: 100, height: 100)
                    
                    Rectangle()
                        .foregroundColor(darkerColourOne)
                        .frame(width: 100, height: 100)
                    
                    Rectangle()
                        .foregroundColor(darkerColourTwo)
                        .frame(width: 100, height: 100)
                    
                    Spacer()
                }
                .padding(.leading)
            }
            Button(action: {
                // Create a new palette instance and add it to the list
                let newPalette = SavedPalette(hue: hue)
                
                // add it to the list
                savedPalettes.append(newPalette)
            }, label: {
                Text("Save")
            })
            Spacer()
        }
        .padding()
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
