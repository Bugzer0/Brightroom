import SwiftUI
import BrightroomEngine
import BrightroomUI

struct ImageEditView: View {
  @StateObject var viewModel: ImageEditViewModel
  
  init(editingStack: EditingStack) {
    _viewModel = StateObject(wrappedValue: ImageEditViewModel(editingStack: editingStack))
  }
  
  var body: some View {
    VStack(spacing: 0) {
      ImagePreviewViewRepresentable(editingStack: viewModel.editingStack)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      ImageEditMenuView(viewModel: viewModel)
        .frame(height: 120)
    }
  }
}

#Preview {
  ImageEditView(editingStack: Mocks.makeEditingStack(image: Mocks.imageHorizontal()))
} 