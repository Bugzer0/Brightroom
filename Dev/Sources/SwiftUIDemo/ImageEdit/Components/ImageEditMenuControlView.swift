import SwiftUI

struct ImageEditMenuControlView: View {
  @ObservedObject var viewModel: ImageEditViewModel
  @State private var selectedFilter: FilterType?
  
  enum FilterType: Identifiable {
    case exposure
    case contrast
    case saturation
    case temperature
    case highlights
    case shadows
    case vignette
    case sharpen
    case clarity
    
    var id: Int {
      switch self {
      case .exposure: return 0
      case .contrast: return 1
      case .saturation: return 2
      case .temperature: return 3
      case .highlights: return 4
      case .shadows: return 5
      case .vignette: return 6
      case .sharpen: return 7
      case .clarity: return 8
      }
    }
  }
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 20) {
        FilterButton(
          title: "Brightness",
          image: "sun.max.fill",
          action: { selectedFilter = .exposure }
        )
        
        FilterButton(
          title: "Contrast", 
          image: "circle.lefthalf.filled",
          action: { selectedFilter = .contrast }
        )
        
        FilterButton(
          title: "Saturation",
          image: "drop.fill",
          action: { selectedFilter = .saturation }
        )
        
        FilterButton(
          title: "Temperature",
          image: "thermometer",
          action: { selectedFilter = .temperature }
        )
        
        FilterButton(
          title: "Highlights",
          image: "sun.max",
          action: { selectedFilter = .highlights }
        )
        
        FilterButton(
          title: "Shadows",
          image: "moon.fill",
          action: { selectedFilter = .shadows }
        )
      }
      .padding()
    }
    .sheet(item: $selectedFilter) { filter in
      NavigationView {
        switch filter {
        case .exposure:
          ImageEditExposureControlRepresentable(viewModel: viewModel)
        case .contrast:
          ImageEditContrastControlRepresentable(viewModel: viewModel)
        case .saturation:
          ImageEditSaturationControlRepresentable(viewModel: viewModel)
        case .temperature:
          ImageEditTemperatureControlRepresentable(viewModel: viewModel)
        case .highlights:
          ImageEditHighlightsControlRepresentable(viewModel: viewModel)
        case .shadows:
          ImageEditShadowsControlRepresentable(viewModel: viewModel)
        case .vignette:
          Text("Vignette Control")
        case .sharpen:
          Text("Sharpen Control")
        case .clarity:
          Text("Clarity Control")
        }
      }
    }
  }
} 
