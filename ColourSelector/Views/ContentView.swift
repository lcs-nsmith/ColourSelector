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
        // "derived value"
        @Binding public var savedPalettes: [SavedPalette]
        
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
        
        //Interface
        var body: some View {
            
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        Rectangle()
                            .frame(width: 130, height: 130)
                            .foregroundColor(baseColour)
                            
                        VStack (spacing: 0){
                            Text("Hue")
                                .bold()
                                .padding(.bottom)
                            
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
                        }
                    }
                    
                    // title and colour patch with the base colour, and its two darker variations
                    Group {
                        HStack {
                            Text("MONOCHROMATIC")
                                .padding(.leading)
                            Spacer()
                        }
                        
                        HStack {
                            MonochromaticPaletteView(selectedHue: selectedHue)
                            Button(action: {
                                // Create a new palette instance
                                let newPalette = SavedPalette(hue: hue)
                                
                                // Add it to the list
                                savedPalettes.append(newPalette)
                            }, label: {
                                Text("SAVE")
                            })
                            .buttonStyle(.bordered)
                            .padding(.trailing)
                        }
                    }
                    
                    // Show the saved palettes
                    List(savedPalettes) { currentPalette in
                        
                        MonochromaticPaletteView(selectedHue: currentPalette.hue * 360)
                        
                    }
                    
                }
                .padding()
                
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        
        static var previews: some View {
            LiveContentView()
        }
        
        // Create a view to simulate the App Level Entry Point -> ContentView connection
        struct LiveContentView: View {
            
            // Populate with some palettes to start...
            @State var palettes: [SavedPalette] = examplePalettes
            
            var body: some View {
                
                ContentView(savedPalettes: $palettes)
                
            }
        }
        
        
    }
