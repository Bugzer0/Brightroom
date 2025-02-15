import SwiftUI
import BrightroomEngine

struct PresetListView: View {
    @ObservedObject var viewModel: ImageEditViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                // Normal/Original filter
                PresetItemView(
                    title: "Normal",
                    image: viewModel.loadedState?.thumbnailImage,
                    isSelected: viewModel.currentPreset == nil
                ) {
                    viewModel.editingStack.set(filters: { $0.preset = nil })
                    viewModel.editingStack.takeSnapshot()
                }
                
                // LUT filters
                ForEach(viewModel.presetPreviews, id: \.filter.identifier) { preset in
                    PresetItemView(
                        title: preset.filter.name,
                        image: preset.image,
                        isSelected: viewModel.currentPreset?.identifier == preset.filter.identifier
                    ) {
                        viewModel.editingStack.set(filters: { $0.preset = preset.filter })
                        viewModel.editingStack.takeSnapshot()
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
                    Image(ciImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? .primary : .secondary)
            }
        }
    }
}

// Helper extension để convert CIImage thành SwiftUI Image
extension Image {
    init(ciImage: CIImage) {
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(ciImage, from: ciImage.extent)!
        self.init(uiImage: UIImage(cgImage: cgImage))
    }
} 