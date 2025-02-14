import SwiftUI
import BrightroomEngine

struct FullscreenIdentifiableView: Identifiable {
    let id = UUID()
    let editingStack: EditingStack
    
    init(editingStack: EditingStack) {
        self.editingStack = editingStack
    }
    
    init(_ makeEditingStack: () -> EditingStack) {
        self.editingStack = makeEditingStack()
    }
} 