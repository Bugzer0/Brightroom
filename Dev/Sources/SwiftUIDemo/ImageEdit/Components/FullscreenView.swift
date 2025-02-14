import SwiftUI
import BrightroomEngine
import BrightroomUI

struct FullscreenView: View {
    @Environment(\.dismiss) private var dismiss
    let editingStack: EditingStack
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ImagePreviewViewRepresentable(editingStack: editingStack)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: Handle save image
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FullscreenView(editingStack: Mocks.makeEditingStack(image: Mocks.imageHorizontal()))
} 