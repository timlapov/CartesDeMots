//
//  CardItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI

struct CardItemView: View {
    @State var offsetX: CGFloat = 0
    @State var onDelete: ()->()
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            
            deleteTrash()
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text("🇫🇷")
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                        .padding(.all, 0)
                }
                Text("Une Voiture")
                    .padding(.top, 0)
                    .font(.headline)
                Text("Автомобиль")
                    .padding(.top, 1)
                Divider()
                Text("Комментарии")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("Текст комментария Текст комментария Текст комментария Текст комментария")
                    .padding(.top, 2)
            }
            .padding()
            .background{
                GlassView()
                // Color(.white).opacity(0.2)
            }
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
            .shadow(color: .black.opacity(0.1), radius: 7)
            .offset(x: offsetX)
            .gesture(DragGesture()
                .onChanged({ value in
                    if value.translation.width < 0 {
                        offsetX = value.translation.width
                    }
                })
                    .onEnded({ value in
                        withAnimation {
                            if screenSize().width * 0.75 < -value.translation.width {
                                withAnimation {
                                    offsetX = -screenSize().width
                                    onDelete()
                                }
                            } else {
                                withAnimation {
                                    offsetX = .zero
                                }
                            }
                        }
                }))
        }
    }
    
    @ViewBuilder
    func deleteTrash() -> some View {
        Image(systemName: "trash.fill")
            .resizable()
            .frame(width: 10, height: 10)
            .offset(x: 10)
            .offset(x: offsetX * 0.6)
            .scaleEffect(CGSize(
                width: -offsetX * 0.006,
                height: -offsetX * 0.006
            ))
    }
}

//#Preview {
//    CardItemView(offsetX: 0, onDelete: () -> ())
//}
