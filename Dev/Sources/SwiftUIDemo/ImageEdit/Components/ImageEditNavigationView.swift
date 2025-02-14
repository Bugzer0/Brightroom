import UIKit

class ImageEditNavigationView: UIView {
  var didTapCancelButton: (() -> Void)?
  var didTapDoneButton: (() -> Void)?
  
  private let cancelButton = UIButton(type: .system)
  private let doneButton = UIButton(type: .system)
  
  init(saveText: String, cancelText: String) {
    super.init(frame: .zero)
    
    backgroundColor = .systemBackground
    
    cancelButton.setTitle(cancelText, for: .normal)
    doneButton.setTitle(saveText, for: .normal)
    
    addSubview(cancelButton)
    addSubview(doneButton)
    
    cancelButton.translatesAutoresizingMaskIntoConstraints = false
    doneButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      doneButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      heightAnchor.constraint(equalToConstant: 44)
    ])
    
    cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func cancelButtonTapped() {
    didTapCancelButton?()
  }
  
  @objc private func doneButtonTapped() {
    didTapDoneButton?()
  }
} 
