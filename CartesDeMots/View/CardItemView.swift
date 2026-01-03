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
    @State private var initialTouchPoint: CGPoint?
    @GestureState private var dragState = false
    @State private var isExpanded = false
    
    var onDelete: ()->()
    var onEdit: (() -> Void)? = nil
    var onResetRating: (() -> Void)? = nil
    var card: Card
    var language: String
    
    var body: some View {
        if #available(iOS 26.0, *) {
            modernCardView()
        } else {
            legacyCardView()
        }
    }
    
    // MARK: - iOS 26+ Modern Design
    @available(iOS 26.0, *)
    private func modernCardView() -> some View {
        VStack(spacing: 0) {
            Button(action: {
                hapticSelection()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    isExpanded.toggle()
                }
            }) {
                cardContent()
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
            // Удалить
        GlassEffectContainer {
            HStack(spacing: 10) {
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
                
                // Редактировать
                if let onEdit = onEdit {
                    Button(action: {
                        hapticSelection()
                        withAnimation(.spring()) {
                            isExpanded = false
                        }
                        onEdit()
                    }) {
                        Image(systemName: "pencil")
                            .font(.title2)
                            .bold()
                            .frame(width: 40, height: 40)
                    }
                    .buttonStyle(.glass)
                    .tint(.blue)
                }
                
                // Сбросить рейтинг
                if let onResetRating = onResetRating {
                    Button(action: {
                        hapticNotification(.success)
                        withAnimation(.spring()) {
                            isExpanded = false
                        }
                        onResetRating()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.title2)
                            .bold()
                            .frame(width: 40, height: 40)
                    }
                    .buttonStyle(.glass)
                    .tint(.orange)
                }
            }
        }
        }

    
    // MARK: - Legacy iOS Design (iOS 18 and below)
    private func legacyCardView() -> some View {
        ZStack(alignment: .trailing) {
            if offsetX < 0 {
                deleteBackground()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
            
            cardContent()
                .background(cardBackground())
                .offset(x: offsetX)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 15)
                        .updating($dragState) { _, state, _ in
                            state = true
                        }
                        .onChanged { value in
                            if initialTouchPoint == nil {
                                initialTouchPoint = value.startLocation
                            }
                            
                            // Check if the drag is mostly horizontal
                            let dragDifference = value.location - (initialTouchPoint ?? .zero)
                            if abs(dragDifference.x) > abs(dragDifference.y) * 2 {
                                if !isDragging {
                                    hapticSelection()
                                    isDragging = true
                                }
                                withAnimation(.interactiveSpring()) {
                                    offsetX = min(0, value.translation.width)
                                }
                            }
                        }
                        .onEnded { value in
                            initialTouchPoint = nil
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
}

extension CGPoint {
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}
// MARK: - Preview

#Preview("Card with comment") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Card.self, configurations: config)
    
    let mockCard = Card(
        foreignWord: "Bonjour",
        translation: "Hello",
        comment: "A common French greeting used throughout the day"
    )
    
    return CardItemView(
        onDelete: {
            print("Delete tapped")
        },
        onEdit: {
            print("Edit tapped")
        },
        onResetRating: {
            print("Reset rating tapped")
        },
        card: mockCard,
        language: "🇫🇷"
    )
    .padding()
    .background {
        Image("bgList")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    .modelContainer(container)
}

#Preview("Card without comment") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Card.self, configurations: config)
    
    let mockCard = Card(
        foreignWord: "Merci",
        translation: "Thank you",
        comment: ""
    )
    
    return CardItemView(
        onDelete: {
            print("Delete tapped")
        },
        onEdit: {
            print("Edit tapped")
        },
        onResetRating: {
            print("Reset rating tapped")
        },
        card: mockCard,
        language: "🇫🇷"
    )
    .padding()
    .background {
        Image("bgList")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    .modelContainer(container)
}

#Preview("Multiple Cards") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Card.self, configurations: config)
    
    let mockCards = [
        Card(foreignWord: "Bonjour", translation: "Hello", comment: "A common French greeting"),
        Card(foreignWord: "Au revoir", translation: "Goodbye", comment: ""),
        Card(foreignWord: "S'il vous plaît", translation: "Please", comment: "Formal version of 'please'"),
        Card(foreignWord: "Merci beaucoup", translation: "Thank you very much", comment: "")
    ]
    
    return ScrollView {
        LazyVStack(spacing: 0) {
            ForEach(mockCards, id: \.id) { card in
                CardItemView(
                    onDelete: {
                        print("Delete tapped for \(card.foreignWord ?? "")")
                    },
                    onEdit: {
                        print("Edit tapped for \(card.foreignWord ?? "")")
                    },
                    onResetRating: {
                        print("Reset rating tapped for \(card.foreignWord ?? "")")
                    },
                    card: card,
                    language: "🇫🇷"
                )
                .padding(.horizontal)
                .padding(.top, 7)
            }
        }
    }
    .background {
        Image("bgList")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    .modelContainer(container)
}

