import SwiftUI
import UIKit
import BrightroomEngine
import BrightroomUI

// UIKit view
final class ImagePreviewView: UIView {
    private let previewView: BrightroomUI.ImagePreviewView
    
    init(editingStack: EditingStack) {
        self.previewView = BrightroomUI.ImagePreviewView(editingStack: editingStack)
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(previewView)
        previewView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewView.topAnchor.constraint(equalTo: topAnchor),
            previewView.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewView.trailingAnchor.constraint(equalTo: trailingAnchor),
            previewView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// SwiftUI wrapper if needed
struct ImagePreviewViewRepresentable: UIViewRepresentable {
    let editingStack: EditingStack
    
    func makeUIView(context: Context) -> ImagePreviewView {
        ImagePreviewView(editingStack: editingStack)
    }
    
    func updateUIView(_ uiView: ImagePreviewView, context: Context) {
        // Update if needed
    }
} 