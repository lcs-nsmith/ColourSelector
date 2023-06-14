//
//  ColourSelectorApp.swift
//  ColourSelector
//
//  Created by Joyce Tao on 2022-10-27.
//

import SwiftUI

@main
struct ColourSelectorApp: App {
    // MARK: Stored Properties
    
    // tracks the list of saved palettes
    // "source of truth"
    @State private var savedPalettes: [SavedPalette] = []
    
    //MARK: Computed Properties
    var body: some Scene {
        WindowGroup {
            ContentView(savedPalettes: $savedPalettes)
        }
    }
}
