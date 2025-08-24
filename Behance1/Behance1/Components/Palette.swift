//
//  Palette.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI


extension Color {
  static func fromHex(_ hex: UInt32) -> Color {
    let b = hex & 0xff
    let g = (hex >> 8) & 0xff
    let r = (hex >> 16) & 0xff
    
    return Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
  }
}

struct Palette {
  static let white = Color.white
  static let whiteDark = Color.fromHex(0xf2f4f7)

  static let teal = Color.fromHex(0xf7f7f7)
  static let blue = Color.fromHex(0x3b82f6)
  static let green = Color.fromHex(0x74ba74)
  static let black = Color.fromHex(0x212121)
  static let yellow = Color.fromHex(0xfacc15)
  static let blueLight = Color.fromHex(0xdeebff)
  static let blackLight = Color.fromHex(0x667085)
  static let greenLight = Color.fromHex(0xd8efd3)
  static let yellowLight = Color.fromHex(0xfff9e3)
}
