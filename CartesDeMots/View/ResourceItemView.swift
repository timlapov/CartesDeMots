//
//  ResourceItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct ResourceItemView: View {
    @State private var offset: CGFloat = 0
    var onDelete: () -> Void
    var resource: Resource
    
    var body: some View {
        ZStack {
            // Фон с корзиной
            if offset < 0 {
                deleteBackground()
                    .transition(.opacity)
            }
            
            // Содержимое карточки
            HStack {
                VStack(alignment: .leading) {
                    Text(resource.title ?? "")
                        .bold()
                    Divider()
                    Link(resource.link ?? "", destination: URL(string: resource.link ?? "lapov.art")!)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(cardBackground())
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 7)
            .offset(x: offset)  // Применяем смещение здесь
        }
        .gesture(
            DragGesture()
                .onChanged(onChanged)
                .onEnded(onEnded)
        )
        .animation(.spring(), value: offset) // Добавляем анимацию
    }
    
    // Функция для отображения фона с корзиной
    private func deleteBackground() -> some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "trash")
                    .font(.title)
                if -offset > UIScreen.main.bounds.width * 0.15 {
                    Text("Swipe to delete")
                        .font(.caption)
                }
            }
            .foregroundColor(.white)
            .frame(width: -offset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.8))
        .cornerRadius(10)
    }
    
    // Функция для отображения фона карточки
    private func cardBackground() -> some View {
        GlassView()
            .background(
                Color.white.opacity(0.2)
                    .overlay(
                        Color.red.opacity(offset < 0 ? -offset / UIScreen.main.bounds.width * 0.5 : 0)
                    )
            )
    }
    
    // Обработчик изменения положения при свайпе
    private func onChanged(_ value: DragGesture.Value) {
        // Обновляем смещение только если свайп влево
        if value.translation.width < 0 {
            offset = value.translation.width
        }
    }
    
    // Обработчик окончания свайпа
    private func onEnded(_ value: DragGesture.Value) {
        withAnimation(.spring()) {
            if -offset > UIScreen.main.bounds.width * 0.6 {
                offset = -UIScreen.main.bounds.width
                onDelete()
            } else {
                offset = 0
            }
        }
    }
}

#Preview {
    ResourcesView()
        .modelContainer(for: Resource.self)
}
