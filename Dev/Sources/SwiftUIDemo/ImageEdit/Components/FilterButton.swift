import SwiftUI
import BrightroomEngine
import BrightroomUI

struct ImageEditFilterButton: View {
    let filter: FilterType
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                if isSelected {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 4, height: 4)
                } else {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 4, height: 4)
                }
                
                Image(filter.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                
                Text(filter.title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.black)
            }
        }
    }
} 