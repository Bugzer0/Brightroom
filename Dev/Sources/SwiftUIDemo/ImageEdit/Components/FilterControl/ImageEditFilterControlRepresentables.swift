import SwiftUI
import BrightroomEngine
import BrightroomUI

struct ImageEditExposureControlRepresentable: UIViewControllerRepresentable {
    let viewModel: ImageEditViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let exposureControl = ImageEditExposureControl(editingStack: viewModel.editingStack, viewModel: viewModel)
        controller.view = exposureControl
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ImageEditContrastControlRepresentable: UIViewControllerRepresentable {
    let viewModel: ImageEditViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let contrastControl = ImageEditContrastControl(editingStack: viewModel.editingStack, viewModel: viewModel)
        controller.view = contrastControl
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ImageEditSaturationControlRepresentable: UIViewControllerRepresentable {
    let viewModel: ImageEditViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let saturationControl = ImageEditSaturationControl(editingStack: viewModel.editingStack, viewModel: viewModel)
        controller.view = saturationControl
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ImageEditTemperatureControlRepresentable: UIViewControllerRepresentable {
    let viewModel: ImageEditViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let temperatureControl = ImageEditTemperatureControl(editingStack: viewModel.editingStack, viewModel: viewModel)
        controller.view = temperatureControl
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ImageEditHighlightsControlRepresentable: UIViewControllerRepresentable {
    let viewModel: ImageEditViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let highlightsControl = ImageEditHighlightsControl(editingStack: viewModel.editingStack, viewModel: viewModel)
        controller.view = highlightsControl
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ImageEditShadowsControlRepresentable: UIViewControllerRepresentable {
    let viewModel: ImageEditViewModel
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let shadowsControl = ImageEditShadowsControl(editingStack: viewModel.editingStack, viewModel: viewModel)
        controller.view = shadowsControl
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
} 