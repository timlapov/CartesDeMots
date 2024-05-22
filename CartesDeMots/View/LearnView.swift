//
//  CardsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI

struct LearnView: View {
    
    @State private var translationIsShown = false
    
    var body: some View {
        ZStack {
            Image("bgLearn")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .all)
            VStack {
                Spacer()
                
                Spacer()
                
                Text("🇫🇷")
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(.all, 0)
                Text("Автомобиль")
                    .padding()
                ZStack {
                    Text("Une Voiture")
                        .padding(.top, 0)
                        .font(.headline)
                    Button(action: { translationIsShown = true }, label: {
                        Text("Show translation")
                            .foregroundStyle(.white)
                            .padding()
                            .background {
                                Color.orange
                                    .cornerRadius(10)
                            }
                            .opacity(translationIsShown ? 0 : 1)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    translationIsShown = false
                }, label: {
                    HStack {
                        Text("Next")
                            .foregroundStyle(.orange)
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.orange)
                    }
                    .padding()
                    .background {
                        GlassView()
                    }
                    .clipShape(Capsule())
                })
//                .offset(y: -150) // Смещение кнопки вверх на 100 пунктов
                
                Spacer()
                
            }
        }
        //        .background {
        //            Image("bgLearn")
        //                 .resizable()
        //                 .scaledToFill()
        //                 .ignoresSafeArea(edges: .all)
        //    }
    }
}

#Preview {
    LearnView()
}
