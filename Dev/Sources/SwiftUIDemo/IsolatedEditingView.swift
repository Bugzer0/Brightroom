import BrightroomEngine
import BrightroomUI
import SwiftUI

struct IsolatedEditinView: View {
  @StateObject var editingStack = Mocks.makeEditingStack(image: Mocks.imageHorizontal())
  @State var fullScreenView: FullscreenIdentifiableView?

  var body: some View {
    Form {
      Section {
        Button("Crop") {
          fullScreenView = FullscreenIdentifiableView(editingStack: editingStack, mode: .crop)
        }
        
        Button("Custom Crop") {
          fullScreenView = FullscreenIdentifiableView(editingStack: editingStack, mode: .customCrop)
        }
        
        Button("Blur Mask") {
          fullScreenView = FullscreenIdentifiableView(editingStack: editingStack, mode: .blurMask)
        }
      }
    }
    .navigationTitle("Isolated-Editing")
    .fullScreenCover(item: $fullScreenView) { view in
      switch view.mode {
      case .crop:
        SwiftUIPhotosCropView(
          editingStack: view.editingStack,
          onDone: {},
          onCancel: {}
        )
      case .customCrop:
        DemoCropView(editingStack: { view.editingStack })
      case .blurMask:
        MaskingViewWrapper(editingStack: view.editingStack)
      }
    }
  }
}
