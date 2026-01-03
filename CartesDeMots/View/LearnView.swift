//
//  CardsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI
import SwiftData
import Pow

struct LearnView: View {
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var viewModel = LearnViewModel()
    
    @Query private var settings: [Settings]
    
    @State private var offset: CGFloat = 0
    @State private var backgroundColor: Color = .clear
    @State private var isCardVisible = true
    @State private var language: String = "🏳️"
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            // Background
            Image("bgLearn")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Content
            VStack {
                if let card = viewModel.currentCard {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.red.opacity(0.7))
                            .frame(height: screenHeight * 0.45)
                            .cornerRadius(20)
                            .overlay(
                                Image(systemName: "bolt.heart")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .opacity(offset > 0 ? min(offset / 50, 1.0) : 0)
                            )
                            .opacity(offset > 0 ? 1 : 0)
                        
                        Rectangle()
                            .fill(Color.green.opacity(0.7))
                            .frame(height: screenHeight * 0.45)
                            .cornerRadius(20)
                            .overlay(
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .opacity(offset < 0 ? min(-offset / 50, 1.0) : 0)
                                
                            )
                            .opacity(offset < 0 ? 1 : 0)
                        
                        // Card
                        if isCardVisible {
                            VStack(alignment: .center) {
                                HStack {
                                    Text(String(format: NSLocalizedString("Complexity %d", comment: "Complexity rating"), card.rating ?? 1))
                                        .foregroundStyle(.gray)
                                        .padding()
                                    Spacer()
                                    Text(language)
                                        .font(.title3)
                                        .foregroundStyle(.gray)
                                        .padding()
                                    //Text("\(String(card.rating ?? -1)) offset: \(offset)")
                                }
                                Text(card.translation ?? "")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                if viewModel.translationIsShown {
                                    Text(card.foreignWord ?? "")
                                        .font(.title2)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.gray)
                                        .padding()
                                } else {
                                    Spacer()
                                    Button(action: {
                                        withAnimation {
                                            viewModel.showTranslation()
                                            hapticSequence()
                                        }
                                    }) {
                                        if #available(iOS 26.0, *) {
                                            Text("Show word")
                                                .bold()
                                                .padding()
                                                .glassEffect(in: .capsule)
                                        } else {
                                            Text("Show word")
                                                .foregroundColor(.white)
                                                .padding()
                                                .background {
                                                    GlassView()
                                                    Color.orange.opacity(0.9)
                                                }
                                                .cornerRadius(10)
                                        }
                                    }
                                    .transition(.movingParts.vanish(.orange))
                                    .conditionalEffect(.repeat(.shake(rate: .fast), every: .seconds(3)), condition: true)
                                }
                                
                                if viewModel.translationIsShown {
                                    Spacer()
                                }
                                
                                // Buttons Easy and Hard
                                HStack {
                                    Button(action: {
                                        hapticImpact()
                                        viewModel.updateRatingAndNextCard(isEasy: true)
                                    }) {
                                        HStack {
                                            Image(systemName: "arrow.left")
                                            Text("Easy")
                                        }
                                        .foregroundColor(.green)
                                        .frame(maxWidth: .infinity)
                                    }
                                    
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.5))
                                        .frame(width: 1, height: 30)
                                    
                                    Button(action: {
                                        hapticImpact()
                                        viewModel.updateRatingAndNextCard(isEasy: false)
                                    }) {
                                        HStack {
                                            Text("Hard")
                                            Image(systemName: "arrow.right")
                                        }
                                        .foregroundColor(.red)
                                        .frame(maxWidth: .infinity)
                                    }
                                }
                                .padding(.vertical, 10)
                            }
                            .frame(height: screenHeight * 0.45)
                            .frame(maxWidth: .infinity)
                            .background(GlassView())
                            .cornerRadius(20)
                            .compositingGroup()
                            .shadow(color: .gray.opacity(0.2), radius: 20)
                            .offset(x: offset)
                            .rotationEffect(.degrees(Double(offset) / 20))
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        offset = gesture.translation.width
                                    }
                                    .onEnded { _ in
                                        if abs(offset) > 140 {
                                            withAnimation(.easeInOut(duration: 0.3)) {
                                                offset = offset > 0 ? screenWidth : -screenWidth
                                                hapticImpact()
                                                isCardVisible = false
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                viewModel.updateRatingAndNextCard(isEasy: offset < 0)
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    offset = 0
                                                    isCardVisible = true
                                                }
                                            }
                                        } else {
                                            withAnimation {
                                                offset = 0
                                            }
                                        }
                                    }
                            )
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: offset > 0 ? .trailing : .leading).combined(with: .opacity)
                            ))
                        }
                    }
                    
                    Spacer()
                } else {
                    Spacer()
                    Text("No words available for learning")
                        .foregroundStyle(.gray)
                        .padding()
                    Spacer()
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.setModelContext(modelContext)
            loadLanguageSetting()
        }
    }
    
    private func loadLanguageSetting() {
        if let firstSettings = settings.first {
            language = firstSettings.language ?? "🏳️"
        }
    }
}

#Preview {
    LearnView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}
