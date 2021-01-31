//
//  BullseyeSlider.swift
//  Bullseye
//
//  Created by Hieu C Trac on 1/19/21.
//

import SwiftUI

struct BullseyeSlider: UIViewRepresentable {
    
    class Coordinator: NSObject {
        var bullseyeSlider: BullseyeSlider
        
        init(_ bullseyeSlider: BullseyeSlider) {
            self.bullseyeSlider = bullseyeSlider
        }
        
        @objc func updateBullseyeSlider(_ sender: UISlider) {
            bullseyeSlider.value = Double(sender.value)
        }
    }
    
    @Binding var value: Double
    var bounds: ClosedRange<Double>
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    func makeCoordinator() -> BullseyeSlider.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider(frame: .zero)
        slider.minimumValue = Float(bounds.lowerBound)
        slider.maximumValue = Float(bounds.upperBound)
        slider.setThumbImage(UIImage(named: UIDevice.current.orientation.isPortrait ? "BullseyeSmall" : "BullseyeLarge"), for: .normal)
        slider.value = Float(value)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.updateBullseyeSlider(_:)), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(self.value)
        uiView.setThumbImage(UIImage(named: UIDevice.current.orientation.isPortrait ? "BullseyeSmall" : "BullseyeLarge"), for: .normal)
    }
}

struct BullseyeSlider_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BullseyeSlider(value: .constant(50), bounds: 0...100)
            Slider(value: .constant(50), in: 0...100)
        }
        .previewLayout(.fixed(width: 568, height: 320))
        VStack {
            BullseyeSlider(value: .constant(50), bounds: 0...100)
            Slider(value: .constant(50), in: 0...100)
        }
        .previewLayout(.fixed(width: 568, height: 320))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        VStack {
            BullseyeSlider(value: .constant(50), bounds: 0...100)
            Slider(value: .constant(50), in: 0...100)
        }
        VStack {
            BullseyeSlider(value: .constant(50), bounds: 0...100)
            Slider(value: .constant(50), in: 0...100)
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
