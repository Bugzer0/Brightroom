import SwiftUI
import BrightroomEngine
import BrightroomUI

struct ImageEditMenuView: View {
    @ObservedObject var viewModel: ImageEditViewModel
    @State private var selectedFilter: FilterType?
    
    enum FilterType: Identifiable {
        case exposure
        case contrast
        case saturation
        case temperature
        case highlights
        case shadows
        
        var id: Int {
            switch self {
            case .exposure: return 0
            case .contrast: return 1
            case .saturation: return 2
            case .temperature: return 3
            case .highlights: return 4
            case .shadows: return 5
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
                }
            }
        }
    }
}

struct FilterButton: View {
    let title: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: image)
                    .font(.system(size: 24))
                Text(title)
                    .font(.caption)
            }
            .foregroundColor(.primary)
            .frame(width: 60, height: 60)
        }
    }
} 