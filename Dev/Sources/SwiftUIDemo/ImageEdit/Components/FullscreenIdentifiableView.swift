import SwiftUI
import BrightroomEngine

struct FullscreenIdentifiableView: Identifiable {
    enum Mode {
        case crop
        case customCrop
        case blurMask
    }
    
    let id = UUID()
    let editingStack: EditingStack
    let mode: Mode
    
    init(editingStack: EditingStack, mode: Mode = .crop) {
        self.editingStack = editingStack
        self.mode = mode
    }
} 