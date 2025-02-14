import SwiftUI
import BrightroomEngine
import BrightroomUI

struct ImageEditView: View {
  @StateObject var viewModel: ImageEditViewModel
  @State private var selectedTab: Tab = .filters
  
  enum Tab {
    case filters
    case edit
  }
  
  init(editingStack: EditingStack) {
    _viewModel = StateObject(wrappedValue: ImageEditViewModel(editingStack: editingStack))
  }
  
  var body: some View {
    VStack(spacing: 0) {
      ImagePreviewViewRepresentable(editingStack: viewModel.editingStack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      // Tab buttons
      HStack {
        Button(action: { selectedTab = .filters }) {
          Text("Filters")
            .foregroundColor(selectedTab == .filters ? .blue : .primary)
            .fontWeight(selectedTab == .filters ? .bold : .regular)
        }
        .frame(maxWidth: .infinity)
        
        Button(action: { selectedTab = .edit }) {
          Text("Edit")
            .foregroundColor(selectedTab == .edit ? .blue : .primary)
            .fontWeight(selectedTab == .edit ? .bold : .regular)
        }
        .frame(maxWidth: .infinity)
      }
      .padding(.vertical, 8)
      
      // Content based on selected tab
      if selectedTab == .filters {
        PresetListView(viewModel: viewModel)
          .frame(height: 120)
      } else {
        ImageEditMenuControlView(viewModel: viewModel)
          .frame(height: 120)
      }
    }
  }
}

#Preview {
  ImageEditView(editingStack: Mocks.makeEditingStack(image: Mocks.imageHorizontal()))
} 