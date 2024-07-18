//
//  CardItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI
import SwiftData

struct CardItemView: View {
    
    @State private var offsetX: CGFloat = 0
    @State private var isDragging = false
    @State private var dragThreshold: CGFloat = 10
    
    var onDelete: ()->()
    var card: Card
    var language: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if offsetX < 0 {
                deleteBackground()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            
            cardContent()
                .background(cardBackground())
                .offset(x: offsetX)
                .gesture(
                    DragGesture()
                        .onChanged(onChanged)
                        .onEnded(onEnded)
                )
        }
        .frame(maxWidth: .infinity)
    }
    
    private func cardContent() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(language)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(.all, 0)
            }
            Text(card.foreignWord ?? "")
                .padding(.top, 0)
                .font(.headline)
            Text(card.translation ?? "")
                .padding(.top, 1)
            
            if let comment = card.comment, !comment.isEmpty {
                Divider()
                Text("Comment")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(card.comment ?? "")
                    
            }
        }
        .padding()
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
            .shadow(color: .black.opacity(0.1), radius: 7, x:  2, y: 2)
    }
    
    private func deleteBackground() -> some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "trash")
                    .font(.title)
                if -offsetX / screenSize().width > 0.3 {
                    Text("Swipe to delete")
                        .font(.caption)
                }
            }
            .foregroundColor(.white)
            .frame(width: -offsetX)
            .opacity(Double(-offsetX / 100))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.8))
    }
    
    private func onChanged(_ value: DragGesture.Value) {
        if abs(value.translation.width) > dragThreshold {
            isDragging = true
        }
        
        if isDragging && value.translation.width < 0 {
            offsetX = value.translation.width
        }
    }
    
    private func onEnded(_ value: DragGesture.Value) {
        
        isDragging = false
        
        withAnimation(.spring()) {
            if -offsetX > screenSize().width * 0.45 {
                offsetX = -screenSize().width
                hapticNotification(.warning)
                onDelete()
            } else {
                offsetX = 0
            }
        }
    }
}

//#Preview {
//    ContentView()
//        .modelContainer(for: Card.self)
//}
