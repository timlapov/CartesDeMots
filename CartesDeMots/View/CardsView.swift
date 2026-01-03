//
//  CardsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI
import SwiftData

struct CardsView: View {
    @Query(sort: [SortDescriptor(\Card.addDate, order: .reverse)], animation: .default) private var cards: [Card]
    @Query private var settings: [Settings]
    
    @Environment(\.modelContext) private var modelContext
    
    //@State var search = ""
    @State private var language: String = "🏳️"
    
    @ObservedObject var cardsViewModel = CardsViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Your list of words")
                    .font(.title)
                    .fontDesign(.rounded)
                    .bold()
                Spacer()
                if #available(iOS 26, *) {
                    Button(action: {
                        hapticSelection()
                        cardsViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .padding(3)
                    })
                    .buttonStyle(.glassProminent)
                    .tint(Color(.orange))
                } else {
                    Button(action: {
                        hapticSelection()
                        cardsViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(7)
                            .background {
                                Circle()
                                    .fill(.orange)
                                    .opacity(0.95)
                            }
                    })
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, -7)

            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(spacing: 0) {
                    ForEach(cards) { card in
                        CardItemView(onDelete: {
                            withAnimation(.spring()) {
                                modelContext.delete(card)
                            }
                        }, card: card, language: language)
                        .padding(.horizontal)
                        .padding(.top, 7)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .scrollDismissesKeyboard(.immediately)
            .scrollIndicators(.visible)
        }
        .background {
            Image("bgList")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(item: $cardsViewModel.addViewHandler) {_ in
            NewWordView(cardsViewModel: cardsViewModel)
        }
        .onAppear {
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
    ContentView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}

extension View {
    func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}
