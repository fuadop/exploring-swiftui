//
//  Calendar.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI

struct WeekCalendar: View {
  var weekday: Int {
    Calendar.current.dateComponents([.weekday, .day], from: Date.now).weekday ?? 0
  }
  
  var week: [Date] {
    var dates: [Date] = []
    
    guard let endOfWeek = Calendar.current.date(byAdding: .day, value: 7 - weekday, to: Date.now) else {
      return dates
    }
    
    for i in 0...6 {
      if let d = Calendar.current.date(byAdding: .day, value: -i, to: endOfWeek) {
        dates.append(d)
      }
    }
    
    return dates.reversed()
  }
  
  var body: some View {
    HStack(spacing: 20) {
      ForEach(week, id: \.self.hashValue) { date in
        VStack(spacing: 15) {
          Text(weekdayToString(extractWeekday(date)))
            .font(.subheadline)
            .foregroundStyle(Palette.green)
          
          if extractWeekday(date) == weekday {
            Text("\(extractDay(date))")
              .font(.subheadline)
              .padding(5)
              .background(Palette.green)
              .foregroundStyle(Palette.white)
              .cornerRadius(5)
          } else {
            Text("\(extractDay(date))")
              .font(.subheadline)
              .padding(5)
              .foregroundStyle(Palette.blackLight)
          }
        }
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Palette.whiteDark)
    .cornerRadius(15)
  }
  
  func extractDay(_ date: Date) -> Int {
    Calendar.current.dateComponents([.day], from: date).day ?? 0
  }
  
  func extractWeekday(_ date: Date) -> Int {
    Calendar.current.dateComponents([.weekday], from: date).weekday ?? 0
  }
  
  func weekdayToString(_ weekday: Int) -> String {
    switch weekday {
    case 1:
      return "S"
    case 2:
      return "M"
    case 3:
      return "T"
    case 4:
      return "W"
    case 5:
      return "T"
    case 6:
      return "F"
    case 7:
      return "S"
    default:
      return ""
    }
  }
}

#Preview {
    WeekCalendar()
}
