import SwiftUI
import BrightroomEngine
import BrightroomUI

struct PresetListView: View {
    @ObservedObject var viewModel: ImageEditViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                // Original filter
                PresetItemView(
                    title: "Normal",
                    image: viewModel.loadedState?.thumbnailImage,
                    isSelected: viewModel.loadedState?.currentEdit.filters.preset == nil
                ) {
                    viewModel.editingStack.set(filters: { $0.preset = nil })
                    viewModel.editingStack.takeSnapshot()
                }
                
                // Preset filters
                if let presets = viewModel.loadedState?.previewFilterPresets {
                    ForEach(presets, id: \.filter.name) { preset in
                        PresetItemView(
                            title: preset.filter.name,
                            image: preset.image,
                            isSelected: viewModel.loadedState?.currentEdit.filters.preset == preset.filter
                        ) {
                            viewModel.editingStack.set(filters: { $0.preset = preset.filter })
                            viewModel.editingStack.takeSnapshot()
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PresetItemView: View {
    let title: String
    let image: CIImage?
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                if let image = image {
                    CIImageView(image: image)
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
                        )
                }
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? .blue : .primary)
            }
        }
    }
}

struct CIImageView: View {
    let image: CIImage
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            if let cgImage = createCGImage(from: image, size: size) {
                Image(decorative: cgImage, scale: 1.0)
                    .resizable()
                    .scaledToFill()
            }
        }
    }
    
    private func createCGImage(from ciImage: CIImage, size: CGSize) -> CGImage? {
        let context = CIContext(options: nil)
        let scale = UIScreen.main.scale
        let scaledSize = CGSize(width: size.width * scale, height: size.height * scale)
        let scaledExtent = CGRect(origin: .zero, size: scaledSize)
        let scaledImage = ciImage.transformed(by: CGAffineTransform(scaleX: scaledSize.width / ciImage.extent.width,
                                                                   y: scaledSize.height / ciImage.extent.height))
        return context.createCGImage(scaledImage, from: scaledExtent)
    }
} 