//
//  SearchView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/01/2026.
//

import SwiftUI
import SwiftData

@available(iOS 26, *)
struct SearchView: View {
    @Query(sort: [SortDescriptor(\Card.addDate, order: .reverse)]) private var cards: [Card]
    @Query private var settings: [Settings]

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismissSearch) private var dismissSearch

    @Binding var searchText: String
    @State private var language: String = "🏳️"

    @ObservedObject var cardsViewModel = CardsViewModel()

    private var filteredCards: [Card] {
        guard !searchText.isEmpty else { return [] }
        return cards.filter { card in
            (card.foreignWord ?? "").localizedCaseInsensitiveContains(searchText) ||
            (card.translation ?? "").localizedCaseInsensitiveContains(searchText) ||
            (card.comment ?? "").localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        Group {
            if searchText.isEmpty {
                emptySearchView
            } else if filteredCards.isEmpty {
                noResultsView
            } else {
                searchResultsView
            }
        }
        .background {
            Image("bgList")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .sheet(item: Binding(
            get: { cardsViewModel.editCardHandler?.handler },
            set: { newValue in
                if newValue == nil {
                    cardsViewModel.editCardHandler = nil
                }
            }
        )) { _ in
            if let editCard = cardsViewModel.editCardHandler?.card {
                NewWordView(cardsViewModel: cardsViewModel, existingCard: editCard)
            }
        }
        .onAppear {
            loadLanguageSetting()
        }
    }

    // MARK: - Empty Search View
    private var emptySearchView: some View {
        ContentUnavailableView(
            NSLocalizedString("search_prompt_title", comment: ""),
            systemImage: "magnifyingglass",
            description: Text(NSLocalizedString("search_prompt_description", comment: ""))
        )
    }

    // MARK: - No Results View
    private var noResultsView: some View {
        ContentUnavailableView.search(text: searchText)
    }

    // MARK: - Search Results View
    private var searchResultsView: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(filteredCards) { card in
                    CardItemView(
                        onDelete: {
                            withAnimation(.spring()) {
                                modelContext.delete(card)
                            }
                        },
                        onEdit: {
                            cardsViewModel.editCardHandler = (card: card, handler: ModalHandler())
                        },
                        onResetRating: {
                            card.rating = 4
                        },
                        card: card,
                        language: language
                    )
                    .padding(.horizontal)
                    .padding(.top, 7)
                }
            }
            .padding(.bottom, 100)
        }
    }

    private func loadLanguageSetting() {
        if let firstSettings = settings.first {
            language = firstSettings.language ?? "🏳️"
        }
    }
}
