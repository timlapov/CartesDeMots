//
//  CardItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

//import SwiftUI
//
//struct CardItemView: View {
//    @State var offsetX: CGFloat = 0
//    @State var onDelete: ()->()
//    
//    var card: Card
//    
//    var body: some View {
//        
//        ZStack(alignment: .trailing) {
//            
//            deleteTrash()
//            
//            VStack(alignment: .leading) {
//                HStack {
//                    Spacer()
//                    Text("🇫🇷")
//                        .fontWeight(.light)
//                        .foregroundStyle(.gray)
//                        .padding(.all, 0)
//                }
//                Text(card.translation)
//                    .padding(.top, 0)
//                    .font(.headline)
//                Text(card.foreignWord)
//                    .padding(.top, 1)
//                
//                if !card.comment.isEmpty {
//                    Divider()
//                    Text("Comment")
//                        .font(.subheadline)
//                        .foregroundStyle(.gray)
//                    Text(card.comment)
//                        .padding(.top, 2)
//                }
//            }
//            .padding()
//            .background{
//                GlassView()
//                // Color(.white).opacity(0.2)
//            }
//            .cornerRadius(10)
//            .padding(.horizontal)
//            .padding(.top, 10)
//            .shadow(color: .black.opacity(0.1), radius: 7)
//            .offset(x: offsetX)
//            .gesture(DragGesture()
//                .onChanged({ value in
//                    if value.translation.width < 0 {
//                        offsetX = value.translation.width
//                    }
//                })
//                    .onEnded({ value in
//                        withAnimation {
//                            if screenSize().width * 0.65 < -value.translation.width {
//                                withAnimation {
//                                    offsetX = -screenSize().width
//                                    onDelete()
//                                }
//                            } else {
//                                withAnimation {
//                                    offsetX = .zero
//                                }
//                            }
//                        }
//                }))
//        }
//    }
//    
//    @ViewBuilder
//    func deleteTrash() -> some View {
//        Image(systemName: "trash.fill")
//            .resizable()
//            .frame(width: 10, height: 10)
//            .offset(x: 10)
//            .offset(x: offsetX * 0.6)
//            .scaleEffect(CGSize(
//                width: -offsetX * 0.006,
//                height: -offsetX * 0.006
//            ))
//    }
//}
//
//#Preview {
//    ContentView()
//        .modelContainer(for: Card.self)
//}

import SwiftUI

struct CardItemView: View {
    @State var offsetX: CGFloat = 0
    @State var onDelete: ()->()
    
    var card: Card
    
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
                Text("🇫🇷")
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(.all, 0)
            }
            Text(card.foreignWord ?? "")
                .padding(.top, 0)
                .font(.headline)
            Text(card.translation ?? "")
                .padding(.top, 1)
            
            if ((card.comment?.isEmpty) == nil) {
                Divider()
                Text("Comment")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(card.comment ?? "")
                    .padding(.top, 2)
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
            .shadow(color: .black.opacity(0.1), radius: 7)
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
        if value.translation.width < 0 {
            offsetX = value.translation.width
        }
    }
    
    private func onEnded(_ value: DragGesture.Value) {
        withAnimation(.spring()) {
            if -offsetX > screenSize().width * 0.6 {
                offsetX = -screenSize().width
                onDelete()
            } else {
                offsetX = 0
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Card.self)
}
