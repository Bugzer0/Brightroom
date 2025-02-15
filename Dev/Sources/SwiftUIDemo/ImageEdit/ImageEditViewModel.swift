import SwiftUI
import BrightroomEngine
import BrightroomUI
import Verge

class ImageEditViewModel: ObservableObject {
  typealias State = EditingStack.State
  
  @Published private(set) var state: State
  let editingStack: EditingStack
  
  // LUTs properties
  @Published private(set) var presetPreviews: [BrightroomEngine.PreviewFilterPreset] = []
  @Published private(set) var currentPreset: BrightroomEngine.FilterPreset?
  
  init(editingStack: EditingStack) {
    self.editingStack = editingStack
    self.state = editingStack.state.primitive
    
    print("[DEBUG] Initial state: \(editingStack.state.primitive)")
    
    editingStack.sinkState { [weak self] changes in
      guard let self = self else { return }
      self.state = changes.primitive
      
      // Update LUTs state
      if let loadedState = changes.loadedState {
        print("[DEBUG] Loaded state updated")
        print("[DEBUG] Preview filter presets count: \(loadedState.previewFilterPresets.count)")
        print("[DEBUG] Current preset: \(loadedState.currentEdit.filters.preset?.name ?? "nil")")
        
        self.presetPreviews = loadedState.previewFilterPresets
        self.currentPreset = loadedState.currentEdit.filters.preset
      }
    }
    
    // Start EditingStack
    editingStack.start()
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
