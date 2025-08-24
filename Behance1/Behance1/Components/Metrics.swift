//
//  Metrics.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI
import Charts

struct MetricLegend: View {
  let title: String
  let color: Color
  let score: Int
  let maxScore: Int
  let unit: String
  
  var body: some View {
    HStack(alignment: .top) {
      Circle()
        .fill(color)
        .frame(width: 10, height: 10)
        .padding(.top, 3)
      
      VStack(alignment: .leading) {
        Text(title)
          .font(.subheadline)

        Text("\(score.formatted())\(unit)/\(Text("\(maxScore.formatted())\(unit)").foregroundStyle(Palette.blackLight))")
          .font(.subheadline)
      }
    }
  }
}

struct Metrics: View {
  let steps = [
    (id: "completed", steps: 8000),
    (id: "pending", steps: 2000),
  ]
  
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .fill(Palette.white)
      .frame(height: 200)
      .overlay {
        HStack {
          Chart(steps, id: \.id) { id, steps in
            SectorMark(angle: .value("", steps), innerRadius: 70, outerRadius: 85, angularInset: 0)
              .cornerRadius(50)
              .foregroundStyle(by: .value("", id))
          }
          .chartLegend(.hidden)
          .chartForegroundStyleScale(range: [Palette.green, Palette.whiteDark])
          .chartBackground { _ in
            VStack {
              Text("Complete")
                .font(.caption)
                .foregroundStyle(Palette.blackLight)
              Text("80%")
                .font(.title.bold())
            }
          }
          .frame(width: 200)
          
          VStack(alignment: .leading) {
            MetricLegend(title: "Steps", color: Palette.greenLight, score: 5000, maxScore: 10000, unit: "")
            MetricLegend(title: "Water", color: Palette.blue, score: 2, maxScore: 2, unit: "L")
            MetricLegend(title: "Sleep", color: Palette.yellow, score: 7, maxScore: 7, unit: "h")
          }
          .padding()
        }
      }
  }
}

#Preview {
  ZStack {
    Color.red
      .ignoresSafeArea()
    
    Metrics()
  }
}
