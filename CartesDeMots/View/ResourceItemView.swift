//
//  ResourceItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct ResourceItemView: View {

    @State private var offsetX: CGFloat = 0
    @State private var isDragging = false
    @State private var initialTouchPoint: CGPoint?
    @State private var isExpanded = false

    var onDelete: () -> Void
    var resource: Resource

    var body: some View {
        if #available(iOS 26.0, *) {
            modernResourceView()
        } else {
            legacyResourceView()
        }
    }

    // MARK: - iOS 26+ Modern Design
    @available(iOS 26.0, *)
    private func modernResourceView() -> some View {
        VStack(spacing: 0) {
            Button(action: {
                hapticSelection()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    isExpanded.toggle()
                }
            }) {
                content()
                    .blur(radius: isExpanded ? 8 : 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 20))
            .overlay {
                if isExpanded {
                    actionButtons()
                }
            }
        }
        .frame(maxWidth: .infinity)
    }

    @available(iOS 26.0, *)
    private func actionButtons() -> some View {
        GlassEffectContainer {
            Button(action: {
                hapticNotification(.warning)
                withAnimation(.spring()) {
                    isExpanded = false
                    onDelete()
                }
            }) {
                Image(systemName: "trash.fill")
                    .font(.title2)
                    .bold()
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.glass)
            .tint(.red)
        }
    }

    // MARK: - Legacy iOS Design (iOS 18 and below)
    private func legacyResourceView() -> some View {
        ZStack(alignment: .trailing) {
            // Фон "удаления" (справа), показывается только когда свайпнули влево
            if offsetX < 0 {
                deleteBackground()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }

            content()
                .background(cardBackground())
                .offset(x: offsetX)
                // Вместо .gesture(...) используем .simultaneousGesture(...)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 15)
                        .onChanged { value in
                            if initialTouchPoint == nil {
                                initialTouchPoint = value.startLocation
                            }
                            let dragDiff = value.location - (initialTouchPoint ?? .zero)
                            // Проверяем, что горизонтальный драг > вертикального * 2
                            if abs(dragDiff.x) > abs(dragDiff.y) * 2 {
                                isDragging = true
                                withAnimation(.interactiveSpring()) {
                                    // Запрещаем сдвиг вправо, чтобы свайп был только влево
                                    offsetX = min(0, value.translation.width)
                                }
                            }
                        }
                        .onEnded { value in
                            initialTouchPoint = nil
                            isDragging = false

                            withAnimation(.spring()) {
                                // Если ушли левее, чем ~ 45% экрана — удаляем
                                if -offsetX > screenSize().width * 0.45 {
                                    offsetX = -screenSize().width
                                    hapticNotification(.warning)
                                    onDelete()
                                } else {
                                    offsetX = 0
                                }
                            }
                        }
                )
        }
        .frame(maxWidth: .infinity)
    }

    private func content() -> some View {
        VStack(alignment: .leading) {
            Text(resource.title ?? "")
                .bold()
            Divider()
            Link(resource.link ?? "", destination: URL(string: resource.link ?? "lapov.art")!)
                .foregroundColor(.gray)
        }
        .padding()
    }

    // Фон с иконкой "мусорной корзины"
    private func deleteBackground() -> some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "trash")
                    .font(.title)
                // Если свайпнули сильнее 15% экрана, показываем текст
                if -offsetX / screenSize().width > 0.15 {
                    Text("Swipe to delete")
                        .font(.caption)
                }
            }
            .foregroundColor(.white)
            // Ширина слоя зависит от величины offset
            .frame(width: -offsetX)
            // Для плавного проявления можем использовать opacity
            .opacity(Double(-offsetX / 100))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.8))
    }

    private func cardBackground() -> some View {
        GlassView()
            .background(
                Color.white.opacity(0.2)
                    .overlay(
                        Color.red.opacity(offsetX < 0 ? -offsetX / screenSize().width * 0.5 : 0)
                    )
            )
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 7, x: 2, y: 2)
    }

    // Вариант метода для вычисления размера экрана
    private func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

#Preview {
    ResourcesView()
        .modelContainer(for: Resource.self)
}
