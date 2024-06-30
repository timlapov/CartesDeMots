//
//  CardsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

//import SwiftUI
//import SwiftData
//import Pow
//
//struct LearnView: View {
//    @Query private var cards: [Card]
//    
//    @Environment(\.modelContext) private var modelContext
//    
//    @State private var translationIsShown = false
//    
//    var randomCard: Card {
//        if let randomCard = cards.randomElement() {
//            return randomCard
//        } else {
//            return Card(foreignWord: "Add the first word to start learning", translation: "Add the first word to start learning", comment: "", rating: 4)
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            HStack{
//                Text("Training")
//                    .font(.title)
//                    .fontDesign(.rounded)
//                    .bold()
//                Spacer()
//            }
//            .padding(.horizontal)
//            
//            Spacer()
//            
//            Spacer()
//            
//            Text("🇫🇷")
//                .fontWeight(.light)
//                .foregroundStyle(.gray)
//                .padding(.all, 0)
//            Text(randomCard.translation ?? "")
//                .padding()
//            ZStack {
//                Text(randomCard.foreignWord ?? "")
//                    .padding(.top, 0)
//                    .font(.headline)
//                Button(action: { translationIsShown = true }, label: {
//                    Text("Show translation")
//                        .foregroundStyle(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background {
//                            Color.orange
//                                .cornerRadius(10)
//                        }
//                        .opacity(translationIsShown ? 0 : 1)
//                        .conditionalEffect(.repeat(.wiggle(rate: .fast), every: .seconds(3)), condition: true)
//                    
//                })
//                .padding()
//            }
//            
//            Spacer()
//            
//            Button(action: {
//                translationIsShown = false
//            }, label: {
//                HStack {
//                    Text("Next")
//                        .foregroundStyle(.orange)
//                    Image(systemName: "chevron.forward")
//                        .foregroundColor(.orange)
//                }
//                .padding()
//                .background {
//                    GlassView()
//                    Color.white.opacity(0.5)
//                }
//                .clipShape(Capsule())
//            })
//            
//            Spacer()
//            
//        }
//        .background {
//            Image("bgLearn")
//                .resizable()
//                .scaledToFill()
//        }
//    }
//}

import SwiftUI
import SwiftData
import Pow

struct LearnView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = LearnViewModel()
    
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
                    
                    Text("🇫🇷")
                        .padding(.all, 0)
                    Text(card.translation ?? "")
                        .padding()
                        .cornerRadius(10)
                    
                    ZStack {
                        Text(card.foreignWord ?? "")
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                        
                        if !viewModel.translationIsShown {
                            Button(action: { viewModel.showTranslation() }, label: {
                                Text("Show translation")
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(10)
                            })
                            .conditionalEffect(.repeat(.wiggle(rate: .fast), every: .seconds(3)), condition: true)
                            .padding()
                        }
                    }
                    
                    Spacer()
                    
                    if viewModel.translationIsShown {
                        HStack {
                            Button(action: { viewModel.updateRatingAndNextCard(isEasy: true) }, label: {
                                Text("Easy")
                                    .foregroundStyle(.green)
                                    .padding()
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(20)
                            })
                            
                            Button(action: { viewModel.updateRatingAndNextCard(isEasy: false) }, label: {
                                Text("Hard")
                                    .foregroundStyle(.red)
                                    .padding()
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(20)
                            })
                        }
                        .padding()
                    }
                    
                    Spacer()
                } else {
                    Spacer()
                    Text("No cards available for learning")
                        .foregroundStyle(.gray)
                        .padding()
                    Spacer()
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.setModelContext(modelContext)
        }
    }
}

#Preview {
    LearnView()
        .modelContainer(for: [Card.self, Resource.self])
}
