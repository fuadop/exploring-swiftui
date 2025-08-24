//
//  ContentView.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI

struct ContentView: View {
  private let routes = [
    (id: "Home", imageName: "house"),
    (id: "Explore", imageName: "square.grid.2x2"),
    (id: "VitAi", imageName: "sparkles"),
    (id: "Profile", imageName: "person"),
  ]
  
  @State private var activeRoute = "Home"

    var body: some View {
      ZStack(alignment: .bottom) {
        TabView(selection: $activeRoute) {
          HomeScreen()
            .tag("Home")
            .toolbar(.hidden, for: .tabBar)
          
          Text("Explore")
            .tag("Explore")
            .toolbar(.hidden, for: .tabBar)

          Text("VitAi")
            .tag("VitAi")
            .toolbar(.hidden, for: .tabBar)

          Text("Profile")
            .tag("Profile")
            .toolbar(.hidden, for: .tabBar)
        }
        
        FloatingBar(routes) { activeRoute = $0 }
          .padding()
      }
    }
}

#Preview {
    ContentView()
}
