import SwiftUI
import BrightroomEngine
import BrightroomUI
import Verge

class ImageEditViewModel: ObservableObject {
  typealias State = EditingStack.State
  
  @Published private(set) var state: State
  let editingStack: EditingStack
  
  init(editingStack: EditingStack) {
    self.editingStack = editingStack
    self.state = editingStack.state.primitive
    
    editingStack.sinkState { [weak self] changes in
      guard let self = self else { return }
      self.state = changes.primitive
    }
  }
  
  var loadedState: EditingStack.State.Loaded? {
    state.loadedState
  }
  
  func setMode(_ mode: ClassicImageEditViewModel.Mode) {
    // Implement if needed
  }
  
  func setTitle(_ title: String) {
    // Implement if needed
  }
} 
