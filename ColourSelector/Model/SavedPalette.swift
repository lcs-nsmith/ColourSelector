//
//  SavedPalette.swift
//  ColourSelector
//
//  Created by Joyce Tao on 2022-10-27.
//

import Foundation

struct SavedPalette: Identifiable {
    let id = UUID() // Universally unique identifier
    let hue: Double
}

let examplePalette = SavedPalette(hue: 0.0)

let examplePalettes = [

    SavedPalette(hue: 10.0)
      
    SavedPalette(hue: 60.0)

    SavedPalette(hue: 120.0)

    SavedPalette(hue: 180.0)

    SavedPalette(hue: 240.0)

]
