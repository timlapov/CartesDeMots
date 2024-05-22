//
//  GlassView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 07/05/2024.
//

import Foundation
import SwiftUI

struct GlassView: UIViewRepresentable {
    var removeAllFilters = false
    
    func makeUIView(context: Context) -> some UIView {
        //let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterialLight))
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            if let backdropLayer = uiView.layer.sublayers?.first {
                if removeAllFilters {
                    backdropLayer.filters = []
                } else {
                    backdropLayer.filters?.removeAll(where: { filter in
                        String(describing: filter) != "gaussianBlur"})
                }
            }
        }
    }
    
}
