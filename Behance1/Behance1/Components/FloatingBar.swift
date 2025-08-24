//
//  FloatingBar.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI

typealias Route = (id: String, imageName: String)

struct FloatingBar: View {
  let routes: [Route]
  let routeChangeAction: (String) -> Void
  
  @State private var predictedActiveRoute = "Home"
  
  init(_ routes: [Route] = [], action: @escaping (_ id: String) -> Void) {
    self.routes = routes
    routeChangeAction = action
  }
  
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(Palette.white)
      .frame(maxWidth: .infinity, maxHeight: 60)
      .shadow(radius: 5)
      .overlay {
        HStack(spacing: 50) {
          ForEach(routes, id: \.id) { route in
            VStack {
              Image(systemName: route.imageName)
                .foregroundStyle(route.id == predictedActiveRoute ? Palette.green : Palette.blackLight)
                .font(.title2.bold())
                .frame(maxHeight: 20)
              
              Text(route.id)
                .font(.caption.bold())
                .foregroundStyle(route.id == predictedActiveRoute ? Palette.green : Palette.blackLight)
              
            }
            .onTapGesture {
              routeChangeAction(route.id)
              predictedActiveRoute = route.id
            }
          }
        }
      }
  }
}

#Preview {
  ZStack {
    Color.red.ignoresSafeArea()
    FloatingBar(
      [
        (id: "Home", imageName: "house"),
        (id: "Explore", imageName: "square.grid.2x2"),
        (id: "VitAi", imageName: "sparkles"),
        (id: "Profile", imageName: "person"),
      ]
    ) { print($0) }
  }
}
