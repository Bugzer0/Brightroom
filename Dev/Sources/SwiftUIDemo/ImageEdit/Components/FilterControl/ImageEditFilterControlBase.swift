import UIKit
import BrightroomEngine
import BrightroomUI
import Verge

class ImageEditFilterControlBase: UIView {
  let editingStack: EditingStack
  let viewModel: ImageEditViewModel
  let slider = ClassicImageEditStepSlider()
  
  init(editingStack: EditingStack, viewModel: ImageEditViewModel) {
    self.editingStack = editingStack
    self.viewModel = viewModel
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    backgroundColor = .systemBackground
    
    addSubview(slider)
    slider.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      slider.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  open var title: String {
    fatalError("Must be overridden")
  }
  
  func didReceiveCurrentEdit(state: Changes<ImageEditViewModel.State>) {
    // To be overridden by subclasses
  }
  
  func pop(animated: Bool) {
    // Handle pop navigation
    viewModel.setMode(.preview)
  }
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    if superview != nil {
      viewModel.setMode(.editing)
      viewModel.setTitle(title)
    } else {
      viewModel.setMode(.preview) 
      viewModel.setTitle("")
    }
  }
} 