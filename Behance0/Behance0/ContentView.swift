//
//  ContentView.swift
//  Behance0
//
//  Created by Fuad Olatunji on 10/08/2025.
//

import SwiftUI

extension Color {
  static func fromHex(_ hex: [UInt8]) -> Self {
    assert(hex.count == 3)
    return Color(red: Double(hex[0])/255, green: Double(hex[1])/255, blue: Double(hex[2])/255)
  }
}

struct AppColors {
  static let bg = Color.fromHex([0x17, 0x19, 0x1a])
  static let primary = Color.fromHex([0xeb, 0xff, 0x58])
  static let secondary = Color.fromHex([0x27, 0x29, 0x2c])
  static let mutedText = Color.fromHex([0x6f, 0x7b, 0x8e])
  static let primaryLight = Color.fromHex([0xd9, 0xeb, 0x50])
  static let secondaryLight = Color.fromHex([0x2e, 0x30, 0x33])
}

struct TubeButton : View {
  let title: String
  let fgColor: Color
  let bgColor: Color
  let btnAction: () -> Void
  var borderHidden: Bool = true
  
  init(_ title: String, isActive: Bool, action: @escaping () -> Void) {
    self.title = title
    fgColor = isActive ? AppColors.bg : .white
    bgColor = isActive ? .white : AppColors.secondary
    btnAction = action
    
    if !isActive {
      borderHidden = false
    }
  }
  
  init(_ title: String, fgColor: Color, bgColor: Color, action: @escaping () -> Void) {
    self.title = title
    self.fgColor = fgColor
    self.bgColor = bgColor
    self.btnAction = action
  }
  
  var body: some View {
    Button {
      btnAction()
    } label: {
      RoundedRectangle(cornerRadius: 25)
        .fill(bgColor)
        .stroke(AppColors.mutedText, lineWidth: borderHidden ? 0 : 1)
        .frame(maxWidth: .infinity, maxHeight: 60)
        .overlay {
          Text(title)
            .font(.subheadline.bold())
            .foregroundStyle(fgColor)
        }
    }
  }
}

struct MetricCard : View {
  let title: String
  let subtitle: String
  let bgColor: Color
  let titleColor: Color
  let subtitleColor: Color
  let iconId: UInt8
  
  static var secondaryTotal: MetricCard {
    Self(
      title: "100",
      subtitle: "Total tests",
      bgColor: AppColors.secondary,
      titleColor: .white,
      subtitleColor: AppColors.mutedText,
      iconId: 0
    )
  }
  
  static var secondaryAverage: MetricCard {
    Self(
      title: "85%",
      subtitle: "Average satisfied result",
      bgColor: AppColors.secondary,
      titleColor: .white,
      subtitleColor: AppColors.mutedText,
      iconId: 1
    )
  }
  
  static var primaryAverage: MetricCard {
    Self(
      title: "85%",
      subtitle: "Average satisfied result",
      bgColor: AppColors.primary,
      titleColor: AppColors.secondary,
      subtitleColor: AppColors.secondary,
      iconId: 2
    )
  }
  
  var body: some View {
    RoundedRectangle(cornerRadius: 40)
      .fill(bgColor)
      .frame(maxWidth: .infinity, maxHeight: 150)
      .overlay {
        VStack(alignment: .leading) {
          HStack {
            Spacer()
            Circle()
              .fill(bgColor == AppColors.secondary ? AppColors.secondaryLight : AppColors.primaryLight)
              .frame(width: 50, height: 50)
              .overlay {
                switch iconId {
                case 1:
                  Image(systemName: "face.smiling")
                    .font(.title3)
                    .foregroundStyle(.orange)
                case 2:
                  Image(systemName: "face.smiling")
                    .font(.title3)
                    .foregroundStyle(AppColors.bg)
                default:
                  Image(systemName: "flask")
                    .font(.title3)
                    .foregroundStyle(.green)
                }
              }
          }
          
          Text(title)
            .font(.title)
            .foregroundStyle(titleColor)
          
          Text(subtitle)
            .font(.subheadline)
            .foregroundStyle(subtitleColor)
          
          Spacer()
        }
        .padding(.bottom)
        .padding(.leading)
        .padding(.top, 7)
        .padding(.trailing, 7)
      }
  }
}

// Description to App (Color Picker by Sindre Sohrus)
// Description: Link to Video explaining Aerospace

struct HomePage : View {
  @State private var activeTab = 0
  
  let bars: [(String, String, CGFloat)] = [
    ("6.4", "PH", 20),
    ("40%", "Moisture", 40),
    ("90%", "Fertility", 80),
    ("30%", "Nutrient", 30),
  ]
  
  var body: some View {
    ZStack {
      AppColors.bg
        .ignoresSafeArea()
      
      VStack {
        // Header Section
        HStack(alignment: .center) {
          VStack(alignment: .leading, spacing: 5) {
            Text("Hello David,")
              .font(.subheadline)
              .foregroundStyle(AppColors.mutedText)
            
            Text("Good Morning!")
              .font(.title.bold())
              .foregroundStyle(.white)
          }
          
          Spacer()
          
          Circle()
            .stroke(AppColors.mutedText, lineWidth: 1)
            .fill(AppColors.secondary)
            .frame(width: 50, height: 50)
            .overlay {
              Image(systemName: "bell")
                .font(.title3)
                .foregroundStyle(.white)
                .overlay {
                  Circle()
                    .fill(AppColors.primary)
                    .position(x: 8, y: -3)
                    .frame(width: 10, height: 10)
                }
            }
        }
        
        // Second Section
        HStack {
          TubeButton("Soil Overview", isActive: activeTab == 0) {
            activeTab = 0
          }
          
          TubeButton("Scan Overview", isActive: activeTab == 1) {
            activeTab = 1
          }
        }
        .padding(.top)
        
        // Third Section
        RoundedRectangle(cornerRadius: 25)
          .fill(AppColors.primary)
          .frame(maxHeight: .infinity)
          .overlay {
            VStack(alignment: .leading) {
              HStack(alignment: .center) {
                Text("Soil Overview")
                  .font(.title2.bold())
                
                Spacer()
                
                Circle()
                  .fill(AppColors.primaryLight)
                  .frame(maxWidth: 50, maxHeight: 50)
                  .overlay {
                    Image(systemName: "thermometer.sun")
                      .font(.title3)
                      .foregroundStyle(.black)
                  }
              }
              .padding(.leading, 5)
              
              HStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 50)
                  .fill(AppColors.primaryLight)
                  .frame(maxWidth: 120, maxHeight: 25)
                  .overlay {
                    Label("3 Days ago", systemImage: "calendar")
                      .font(.system(size: 12).bold())
                  }
                
                RoundedRectangle(cornerRadius: 50)
                  .fill(AppColors.primaryLight)
                  .frame(maxWidth: 120, maxHeight: 25)
                  .overlay {
                    Label("Flower Plant", systemImage: "tree")
                      .font(.system(size: 12).bold())
                  }
                
                Spacer()
              }
              .padding(.leading, 5)
              
              Spacer()
              
              HStack(alignment: .bottom, spacing: 10) {
                ForEach(bars, id: \.self.1) { bar in
                  VStack(spacing: 5) {
                    Text(bar.0)
                      .font(.system(size: 12).bold())
                    
                    Text(bar.1)
                      .font(.system(size: 12))
                      .foregroundStyle(AppColors.mutedText)
                    
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, topTrailing: 20))
                      .fill(.black)
                      .frame(maxWidth: .infinity, maxHeight: bar.2)
                  }
                }
              }
              .frame(maxHeight: .infinity)
              
              // Pills
              HStack(alignment: .center, spacing: 3) {
                Spacer()
                
                RoundedRectangle(cornerRadius: 50)
                  .fill(.black)
                  .frame(maxWidth: 20, maxHeight: 5)
                
                RoundedRectangle(cornerRadius: 50)
                  .fill(.gray)
                  .frame(maxWidth: 10, maxHeight: 5)
                
                RoundedRectangle(cornerRadius: 50)
                  .fill(.gray)
                  .frame(maxWidth: 10, maxHeight: 5)
                
                Spacer()
              }
              .padding(.bottom, 5)
            }
            .padding(5)
          }
        
        // Fourth Section
        HStack {
          MetricCard.secondaryTotal
          MetricCard.secondaryAverage
        }
      }
    }
  }
}

struct SoilTestPage: View {
  let history: [(String, String)] = [
    ("Rose Flower plant", "3 Days ago"),
    ("Lavender plant", "5 Days ago"),
    ("Sunflower plant", "1 Week ago"),
  ]
  
  var historyView: some View {
    VStack(spacing: 5) {
      ForEach(history, id: \.self.0) { item in
        RoundedRectangle(cornerRadius: 50)
          .fill(AppColors.secondary)
          .frame(maxWidth: .infinity, maxHeight: 100)
          .overlay {
            HStack(alignment: .center) {
              VStack(alignment: .leading) {
                Text(item.0)
                  .font(.headline)
                  .foregroundStyle(.white)
                
                Label(item.1, systemImage: "calendar")
                  .font(.subheadline)
                  .foregroundStyle(AppColors.mutedText)
              }
              .padding(.leading, 10)
              
              Spacer()
              
              Circle()
                .fill(AppColors.secondaryLight)
                .overlay {
                  Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                }
            }
            .padding(5)
          }
      }
    }
  }
  
  var body: some View {
    ZStack {
      AppColors.bg
        .ignoresSafeArea()
      
      VStack {
        VStack(alignment: .leading) {
          Text("Soil Test")
            .font(.title.bold())
            .foregroundStyle(.white)
          
          
          Text("Test history and insights")
            .font(.subheadline)
            .foregroundStyle(AppColors.mutedText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        // Secion Section
        HStack {
          MetricCard.secondaryTotal
          MetricCard.primaryAverage
        }
        .padding(.top, 20)
        
        // Third Section
        HStack(alignment: .center) {
          Text("Test History")
            .font(.headline)
            .foregroundStyle(.white)
          
          Spacer()
          
          Text("See all")
            .font(.subheadline)
            .foregroundStyle(.white)
        }
        .padding(.top, 20)
        
        // Fourth Section
        historyView
        
        Spacer()
        
        // Fifth Section
        TubeButton("Start a New Test", fgColor: AppColors.bg, bgColor: AppColors.primary) {
          print("ok")
        }
      }
    }
  }
}

struct ContentView: View {
  @State private var activeTab = "Home"
  let tabs: [(String, String)] = [
    ("Home", "house"),
    ("SoilTest", "thermometer.sun"),
    ("EmptyPage1", "barcode.viewfinder"),
    ("EmptyPage2", "testtube.2"),
    ("EmptyPage3", "gearshape"),
  ]
  
  var body: some View {
    ZStack {
      AppColors.bg
        .ignoresSafeArea()
      
      VStack {
        TabView(selection: $activeTab) {
          HomePage()
            .tag("Home")
            .toolbar(.hidden, for: .tabBar)
          
          SoilTestPage()
            .tag("SoilTest")
            .toolbar(.hidden, for: .tabBar)
          
          Text("Empty Page")
            .tag("EmptyPage1")
            .toolbar(.hidden, for: .tabBar)
          
          Text("Empty Page")
            .tag("EmptyPage2")
            .toolbar(.hidden, for: .tabBar)
          
          Text("Empty Page")
            .tag("EmptyPage3")
            .toolbar(.hidden, for: .tabBar)
        }
        
        Spacer()
        
        // Custom Navbar
        VStack {
          RoundedRectangle(cornerRadius: 25)
            .fill(AppColors.secondary)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .overlay {
              HStack(spacing: 3) {
                ForEach(tabs, id: \.self.0) { tab in
                  Button {
                    activeTab = tab.0
                  } label: {
                    RoundedRectangle(cornerRadius: 20)
                      .fill(tab.1 == "barcode.viewfinder" ? AppColors.primary : AppColors.secondaryLight)
                      .frame(maxWidth: 60, maxHeight: .infinity)
                      .overlay {
                        Image(systemName: tab.1)
                          .font(.title2)
                          .foregroundStyle(
                            tab.1 == "barcode.viewfinder" ?
                            AppColors.bg :
                              activeTab == tab.0 ? AppColors.primary : .white
                          )
                      }
                  }
                }
              }
              .padding(4)
            }
        }
        .padding(.top, 10)
        .padding(.leading, 20)
        .padding(.trailing, 20)
      }
      .padding(10)
    }
  }
}

#Preview {
  ContentView()
}
