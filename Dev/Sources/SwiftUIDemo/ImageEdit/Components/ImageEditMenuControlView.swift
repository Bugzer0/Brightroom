import SwiftUI
import BrightroomEngine
import BrightroomUI

struct ImageEditMenuControlView: View {
    @ObservedObject var viewModel: ImageEditViewModel
    @State private var selectedFilter: FilterType?
    
    var body: some View {
        VStack(spacing: 0) {
            // Main content area
            Spacer()
            
            // Filter control area if filter is selected
            if let filter = selectedFilter {
                filterControlView(for: filter)
                    .transition(.move(edge: .bottom))
                    .background(Color(UIColor.systemBackground))
            }
            
            // Bottom menu with filter buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(FilterType.allCases, id: \.self) { filter in
                        ImageEditFilterButton(
                            filter: filter,
                            isSelected: selectedFilter == filter,
                            hasChanges: hasChanges(for: filter),
                            action: {
                                withAnimation {
                                    if selectedFilter == filter {
                                        selectedFilter = nil
                                        // Take snapshot when deselecting filter
                                        viewModel.editingStack.takeSnapshot()
                                    } else {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal, 36)
            }
            .frame(height: 100)
            .background(Color(UIColor.systemBackground))
        }
    }
    
    @ViewBuilder
    private func filterControlView(for filter: FilterType) -> some View {
        VStack {
            // Navigation bar
            HStack {
                Button("Cancel") {
                    withAnimation {
                        // Revert changes when canceling
                        viewModel.editingStack.revertEdit()
                        selectedFilter = nil
                    }
                }
                Spacer()
                Text(filter.title)
                    .font(.headline)
                Spacer()
                Button("Done") {
                    withAnimation {
                        // Take snapshot when done
                        viewModel.editingStack.takeSnapshot()
                        selectedFilter = nil
                    }
                }
            }
            .padding()
            
            // Filter control content
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
        .frame(height: 150)
    }
    
    private func hasChanges(for filter: FilterType) -> Bool {
        guard let loadedState = viewModel.editingStack.store.state.loadedState else {
            return false
        }
        
        switch filter {
        case .exposure:
            return loadedState.currentEdit.filters.exposure != nil
        case .contrast:
            return loadedState.currentEdit.filters.contrast != nil
        case .saturation:
            return loadedState.currentEdit.filters.saturation != nil
        case .temperature:
            return loadedState.currentEdit.filters.temperature != nil
        case .highlights:
            return loadedState.currentEdit.filters.highlights != nil
        case .shadows:
            return loadedState.currentEdit.filters.shadows != nil
        }
    }
} 
