//
//  Goals.swift
//  Behance1
//
//  Created by Fuad Olatunji on 2025-08-23.
//

import SwiftUI

struct GoalItem: View {
  let title: String
  let subTitle: String
  let imageName: String
  let primaryColor: Color
  let secondaryColor: Color
  let progress: Int
  let rotation: Double

  var body: some View {
    HStack {
      Circle()
        .fill(secondaryColor)
        .frame(width: 50, height: 50)
        .overlay {
          Image(systemName: imageName)
            .foregroundStyle(primaryColor)
            .rotationEffect(.degrees(rotation))
        }
      
      VStack(alignment: .leading) {
        Text(title)
          .font(.headline)
        
        Text(subTitle)
          .font(.subheadline)
          .foregroundStyle(Palette.blackLight)
      }
      
      Spacer()
      
      VStack(alignment: .trailing) {
        ProgressView(value: Double(progress) / 100)
          .tint(primaryColor)
          .scaleEffect(x: 1, y: 1.5)
        
        Text("\(progress)%")
          .font(.caption)
          .foregroundStyle(Palette.blackLight)
      }
      .frame(maxWidth: 80)
    }
    .padding()
    .background(Palette.white)
    .cornerRadius(25)
  }
}

struct GoalCheckmark: View {
  @State private var isChecked = false
  
  var body: some View {
    Circle()
      .fill(isChecked ? Palette.green : Palette.white)
      .stroke(Palette.whiteDark, lineWidth: isChecked ? 0 : 2)
      .frame(width: 30, height: 30)
      .overlay {
        Image(systemName: "checkmark")
          .font(.subheadline)
          .foregroundStyle(Palette.white)
      }
      .onTapGesture {
        isChecked.toggle()
      }
  }
}

struct Goals: View {
  let goals = [
    (title: "Steps", subTitle: "Daily 10,000 steps", imageName: "shoe", primaryColor: Palette.green, secondaryColor: Palette.greenLight, progress: 50, rotation: 45),
    (title: "Water", subTitle: "Drink 2L", imageName: "hourglass", primaryColor: Palette.blue, secondaryColor: Palette.blueLight, progress: 100, rotation: 315),
    (title: "Sleep", subTitle: "7 hours of sleep", imageName: "bed.double", primaryColor: Palette.yellow, secondaryColor: Palette.yellowLight, progress: 100, rotation: 0),
  ]
  
  var body: some View {
      VStack(spacing: 15) {
        HStack {
          Text("Goals")
            .font(.title3.bold())
          
          Spacer()
        }
        
        ForEach(goals, id: \.self.title) { title, subTitle, imageName, primaryColor, secondaryColor, progress, rotation in
          HStack(spacing: 10) {
            GoalCheckmark()
            
            GoalItem(title: title, subTitle: subTitle, imageName: imageName, primaryColor: primaryColor, secondaryColor: secondaryColor, progress: progress, rotation: Double(rotation))
          }
        }
        
        Text("\(Image(systemName: "plus")) Add New Goal")
          .font(.subheadline.bold())
          .foregroundStyle(Palette.green)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Palette.white)
          .cornerRadius(15)
      }
    }
}

#Preview {
  ZStack {
    Color.red
      .ignoresSafeArea()
    Goals()
  }
}
