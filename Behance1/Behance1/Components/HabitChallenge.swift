//
//  HabitChallenge.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI

struct HabitChallenge: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 10) {
        Text("21-Day Habit Challenge \(Text("6").foregroundStyle(Palette.greenLight))\(Text("/21").foregroundStyle(Palette.blackLight))")
          .font(.headline.bold())
        
        Text("Drink 2L water")
          .font(.subheadline)
          .foregroundStyle(Palette.blackLight)
        
        Text("Reveal Today's Surprise 🎁")
          .padding(7)
          .font(.subheadline)
          .background(Palette.greenLight)
          .cornerRadius(10)
      }
      .padding(.leading, 10)
      
      Spacer()
      
      Image(systemName: "gift")
        .font(.system(size: 128))
        .foregroundStyle(Palette.greenLight)
        .rotationEffect(.degrees(330))
        .padding(.trailing, -40)
    }
    .background(Palette.white)
    .frame(height: 140)
    .cornerRadius(25)
  }
}

#Preview {
  ZStack {
    Color.red
      .ignoresSafeArea()
    HabitChallenge()
  }
}
