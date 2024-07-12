import SwiftUI

public struct ColorSliderView: UIViewRepresentable {
    @Binding var selectedColor: UIColor
    var orientation: Orientation
    var previewSide: DefaultPreviewView.Side
    var borderWidth: CGFloat
    var borderColor: UIColor

    public init(selectedColor: Binding<UIColor>, orientation: Orientation = .horizontal, previewSide: DefaultPreviewView.Side = .top, borderWidth: CGFloat = 0, borderColor: UIColor = .clear) {
        self._selectedColor = selectedColor
        self.orientation = orientation
        self.previewSide = previewSide
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }

    public func makeUIView(context: Context) -> ColorSlider {
        let colorSlider = ColorSlider(orientation: orientation, previewSide: previewSide)
        colorSlider.gradientView.layer.borderWidth = borderWidth
        colorSlider.gradientView.layer.borderColor = borderColor.cgColor
        colorSlider.addTarget(context.coordinator, action: #selector(Coordinator.colorChanged(_:)), for: .valueChanged)
        return colorSlider
    }

    public func updateUIView(_ uiView: ColorSlider, context: Context) {
        DispatchQueue.main.async {
            uiView.color = self.selectedColor
        }
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
            DispatchQueue.main.async {
                self.parent.selectedColor = slider.color
            }
        }
    }
}
