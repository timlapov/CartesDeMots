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

extension View {
    /// Оборачивает контент в капсулу из Liquid Glass, чтобы он читался как нажимаемый контрол.
    /// На iOS 26 — нативный интерактивный `.glassEffect` (реагирует на нажатие свечением/сжатием);
    /// на iOS < 26 — блюр `GlassView` со светлым подслоем для контраста текста.
    @ViewBuilder
    func glassCapsule() -> some View {
        if #available(iOS 26, *) {
            self.glassEffect(.regular.interactive(), in: .capsule)
        } else {
            self
                .background {
                    GlassView()
                    Color.white.opacity(0.35)
                }
                .clipShape(Capsule())
        }
    }
}
