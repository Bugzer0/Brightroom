import UIKit
import BrightroomEngine
import BrightroomUI
import Verge

final class ImageEditShadowsControl: ImageEditFilterControlBase {
    override var title: String {
        return "Shadows"
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
        let value = currentEdit.filters.shadows?.value ?? 0
        slider.set(value: value, in: FilterShadows.range)
    }
    
    override func didReceiveCurrentEdit(state: Changes<ImageEditViewModel.State>) {
        state.ifChanged(\.loadedState?.currentEdit.filters.shadows).do { value in
            let currentValue = value?.value ?? 0
            slider.set(value: currentValue, in: FilterShadows.range)
        }
    }
    
    @objc private func valueChanged() {
        let value = slider.transition(in: FilterShadows.range)
        
        guard value != 0 else {
            editingStack.set(filters: { $0.shadows = nil })
            return
        }
        
        editingStack.set(filters: {
            var f = FilterShadows()
            f.value = value
            $0.shadows = f
        })
    }
} 