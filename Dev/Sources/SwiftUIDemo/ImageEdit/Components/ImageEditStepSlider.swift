import UIKit
import BrightroomEngine

final class ImageEditStepSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        minimumTrackTintColor = .systemBlue
        maximumTrackTintColor = .systemGray4
    }
    
    func set<T>(value: Double, in range: ParameterRange<Double, T>) {
        self.minimumValue = Float(range.min)
        self.maximumValue = Float(range.max)
        self.value = Float(value)
    }
    
    func transition<T>(in range: ParameterRange<Double, T>) -> Double {
        return Double(value)
    }
} 
