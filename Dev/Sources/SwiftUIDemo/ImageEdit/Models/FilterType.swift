import SwiftUI
import BrightroomEngine
import BrightroomUI

enum FilterType: CaseIterable, Identifiable {
    case exposure
    case contrast
    case saturation
    case temperature
    case highlights
    case shadows
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .exposure:
            return "Brightness"
        case .contrast:
            return "Contrast"
        case .saturation:
            return "Saturation"
        case .temperature:
            return "Temperature"
        case .highlights:
            return "Highlights"
        case .shadows:
            return "Shadows"
        }
    }
    
    var iconName: String {
        switch self {
        case .exposure:
            return "brightness"
        case .contrast:
            return "contrast"
        case .saturation:
            return "saturation"
        case .temperature:
            return "temperature"
        case .highlights:
            return "highlights"
        case .shadows:
            return "shadows"
        }
    }
} 