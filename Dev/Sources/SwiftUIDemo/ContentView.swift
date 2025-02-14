import BrightroomEngine
import BrightroomUI
import PhotosUI
import SwiftUI

struct ContentView: View {
  @State private var fullScreenView: FullscreenIdentifiableView?
  @State var horizontalStack = Mocks.makeEditingStack(image: Mocks.imageHorizontal())
  @State var verticalStack = Mocks.makeEditingStack(image: Mocks.imageVertical())
  
  var body: some View {
    NavigationView {
      Form {
        Section("Image Editing") {
          NavigationLink("Edit Image") {
            ImageEditView(editingStack: horizontalStack)
          }
          
          NavigationLink("Image Preview") {
            DemoCropView2(editingStack: {
              horizontalStack
            })
          }
        }
        
        Section("Other Features") {
          NavigationLink("Isolated", destination: IsolatedEditinView())
          
          Button("Show Fullscreen") {
            fullScreenView = .init(editingStack: horizontalStack)
          }
          .fullScreenCover(item: $fullScreenView) { view in
            FullscreenView(editingStack: view.editingStack)
          }
        }
      }
      .navigationTitle("Brightroom Demo")
    }
  }
}

#Preview {
  ContentView()
} 
