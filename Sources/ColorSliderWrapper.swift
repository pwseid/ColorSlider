import SwiftUI

public struct ColorSliderView: UIViewRepresentable {
    @Binding var selectedColor: UIColor

    public init(selectedColor: Binding<UIColor>) {
        self._selectedColor = selectedColor
    }

    public func makeUIView(context: Context) -> ColorSlider {
        let colorSlider = ColorSlider(orientation: .vertical, previewSide: .left)
        colorSlider.addTarget(context.coordinator, action: #selector(Coordinator.colorChanged(_:)), for: .valueChanged)
        return colorSlider
    }

    public func updateUIView(_ uiView: ColorSlider, context: Context) {
        uiView.color = selectedColor
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public class Coordinator: NSObject {
        var parent: ColorSliderView

        init(_ parent: ColorSliderView) {
            self.parent = parent
        }

        @objc public func colorChanged(_ slider: ColorSlider) {
            parent.selectedColor = slider.color
        }
    }
}
