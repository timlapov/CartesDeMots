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
        if #available(iOS 26, *) {
            // Используем UIGlassEffect для iOS 26 - новый Liquid Glass
            let glassEffect = UIGlassEffect()
            glassEffect.isInteractive = true
            let view = UIVisualEffectView(effect: glassEffect)
            return view
        } else {
            // Используем старый UIBlurEffect для iOS < 26
            let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
            return view
        }
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if #available(iOS 26, *) {
            // Для iOS 26 с UIGlassEffect фильтры не нужны
            return
        } else {
            // Для старых версий применяем фильтры
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
}
