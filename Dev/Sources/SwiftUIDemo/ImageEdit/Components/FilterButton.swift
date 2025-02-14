import SwiftUI

struct ImageEditFilterButton: View {
    let title: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: image)
                    .font(.system(size: 24))
                Text(title)
                    .font(.caption)
            }
            .foregroundColor(.primary)
            .frame(width: 80, height: 80)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
} 