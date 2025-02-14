import UIKit
import BrightroomEngine
import BrightroomUI
import Verge

final class ImageEditContrastControl: ImageEditFilterControlBase {
  
  override var title: String {
    return "Contrast"
  }

  private lazy var navigationView = ImageEditNavigationView(saveText: "Done", cancelText: "Cancel")
  
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
    setupNavigationView()
  }
  
  private func setupNavigationView() {
    addSubview(navigationView)
    navigationView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      navigationView.topAnchor.constraint(equalTo: topAnchor),
      navigationView.leadingAnchor.constraint(equalTo: leadingAnchor),
      navigationView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
    
    navigationView.didTapCancelButton = { [weak self] in
      guard let self = self else { return }
      self.editingStack.revertEdit()
      self.pop(animated: true)
    }
    
    navigationView.didTapDoneButton = { [weak self] in
      guard let self = self else { return }
      self.editingStack.takeSnapshot()
      self.pop(animated: true)
    }
  }
  
  private func updateSliderValue() {
    guard let currentEdit = editingStack.state.loadedState?.currentEdit else { return }
    let value = currentEdit.filters.contrast?.value ?? 0
    slider.set(value: value, in: FilterContrast.range)
  }
  
  override func didReceiveCurrentEdit(state: Changes<ImageEditViewModel.State>) {
    state.ifChanged(\.loadedState?.currentEdit.filters.contrast).do { value in
      let currentValue = value?.value ?? 0
      slider.set(value: currentValue, in: FilterContrast.range)
    }
  }
  
  @objc private func valueChanged() {
    let value = slider.transition(in: FilterContrast.range)
    
    guard value != 0 else {
      editingStack.set(filters: { $0.contrast = nil })
      return
    }
    
    editingStack.set(filters: {
      var f = FilterContrast()
      f.value = value
      $0.contrast = f
    })
  }
} 