import UIKit
import BrightroomEngine
import BrightroomUI
import Verge

final class ImageEditTemperatureControl: ImageEditFilterControlBase {
    override var title: String {
        return "Temperature"
    }
    
    override init(editingStack: EditingStack, viewModel: ImageEditViewModel) {
        super.init(editingStack: editingStack, viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView() {
        super.setupView()
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        updateSliderValue()
    }
    
    private func updateSliderValue() {
        guard let currentEdit = editingStack.state.loadedState?.currentEdit else { return }
        let value = currentEdit.filters.temperature?.value ?? 0
        slider.set(value: value, in: FilterTemperature.range)
    }
    
    override func didReceiveCurrentEdit(state: Changes<ImageEditViewModel.State>) {
        state.ifChanged(\.loadedState?.currentEdit.filters.temperature).do { value in
            let currentValue = value?.value ?? 0
            slider.set(value: currentValue, in: FilterTemperature.range)
        }
    }
    
    @objc private func valueChanged() {
        let value = slider.transition(in: FilterTemperature.range)
        
        guard value != 0 else {
            editingStack.set(filters: { $0.temperature = nil })
            return
        }
        
        editingStack.set(filters: {
            var f = FilterTemperature()
            f.value = value
            $0.temperature = f
        })
    }
} 