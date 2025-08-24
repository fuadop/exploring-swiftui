//
//  Home.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI

struct HomeScreen: View {
  var body: some View {
    ZStack {
      Palette.teal
        .ignoresSafeArea()
      
      VStack {
        UnevenRoundedRectangle(bottomLeadingRadius: 40, bottomTrailingRadius: 40)
          .fill(Palette.greenLight)
          .frame(maxHeight: 240)
          .overlay {
            VStack(alignment: .leading) {
              HStack{
                Text("Good Morning \(Text("Gizem!").bold())")
                  .font(.title3)
                
                Spacer()
                
                Circle()
                  .frame(width: 40, height: 40)
              }
              
              HStack {
                Image("VitAi")
                
                VStack(alignment: .leading) {
                  Text("You're doing great today!")
                  Button {
                    
                  } label: {
                    Text("Chat with VitAI \(Image(systemName: "sparkles"))")
                      .font(.subheadline)
                      .foregroundStyle(Palette.black)
                  }
                  .padding(8)
                  .background(Palette.white)
                  .cornerRadius(10)
                }
                
                Spacer()
              }
            }
            .padding()
            .padding(.top, 50)
          }
        
        Spacer()
        
        ScrollView {
          VStack(spacing: 20) {
            Metrics()
            HabitChallenge()
            Goals()
              .padding(.bottom, 130)
          }
          .padding()
        }
        .scrollIndicators(.hidden)
        .onScrollGeometryChange(for: Bool.self) { geo in
          print(geo)
          return true
        } action: { wasBeyondZero, isBeyondZero in
          print("wasBeyondZero: \(wasBeyondZero), isBeyondZero: \(isBeyondZero)")
        }
      }
      .frame(maxHeight: .infinity)
      .ignoresSafeArea()
    }
  }
}

#Preview {
  HomeScreen()
}
