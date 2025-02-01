//
//  LongPressButtonView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 01/02/2025.
//
import SwiftUI

struct LongPressButton: View {
    @State private var progress: CGFloat = 0

    let image: Image
    var backgroundColor = Color.clear
    var foregroundColor = Color.primary
    var strokeColor = Color.red
    var strokeWidth: CGFloat = 6
    var action: () -> Void

    var body: some View {
        image
            .font(.title)
            .foregroundColor(foregroundColor)
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
            .padding()
            .background(
                Circle().fill(backgroundColor)
            )
            .overlay(
                Circle()
                    .rotation(Angle(degrees: -90))
                    .trim(from: 0, to: progress)
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
            )
            .onLongPressGesture(minimumDuration: 0.6, pressing: { isPressing in
                if isPressing {
                    // Начинаем анимировать заполнение круга до 1 за 0.5 секунд
                    withAnimation(.linear(duration: 0.6)) {
                        self.progress = 1
                    }
                } else {
                    // Если пользователь отпускает до истечения времени, сбрасываем прогресс
                    self.progress = 0
                }
            }, perform: {
                // Когда длительное нажатие успешно завершилось, выполняем действие
                action()
                // Сбрасываем прогресс, чтобы круг исчез
                self.progress = 0
            })
    }
}


#Preview {
    LongPressButton(image: Image(systemName: "trash"), action: { print("Long pressed!") })
}
