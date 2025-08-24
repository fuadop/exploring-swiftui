//
//  Home.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI

struct HomeScreen: View {
  @State private var headerHeight: CGFloat = 240
  
  var body: some View {
    ZStack {
      Palette.teal
        .ignoresSafeArea()
      
      VStack {
        UnevenRoundedRectangle(bottomLeadingRadius: 40, bottomTrailingRadius: 40)
          .fill(Palette.greenLight)
          .frame(height: headerHeight)
          .overlay {
            VStack(alignment: .leading) {
              HStack{
                Text(headerHeight < 200 ? "\(Text("Home").bold())": "Good Morning \(Text("Gizem!").bold())")
                  .font(.title3)
                
                Spacer()
                
                Circle()
                  .fill(Palette.green)
                  .frame(width: 40, height: 40)
                  .overlay {
                    Image(systemName: "person")
                  }
              }
              
              if headerHeight >= 200 {
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
        .onScrollGeometryChange(for: Double.self) { geo in
          geo.contentOffset.y
        } action: { _, new in
          let h = (new / 500) * 110
          let newHeight = headerHeight - h
          
          if newHeight >= 120 && newHeight <= 240 {
            headerHeight = newHeight
          }
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
