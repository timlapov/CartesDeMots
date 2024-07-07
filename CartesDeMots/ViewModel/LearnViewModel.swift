//
//  LearnViewModel.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 30/06/2024.
//

import SwiftUI
import SwiftData

class LearnViewModel: ObservableObject {
    @Published var currentCard: Card?
    @Published var translationIsShown = false
    
    private var cards: [Card] = []
    private var modelContext: ModelContext?
    
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
        fetchCards()
        selectRandomCard()
    }
    
    func fetchCards() {
        guard let context = modelContext else { return }
        let descriptor = FetchDescriptor<Card>(predicate: #Predicate { $0.rating ?? 0 > 0 })
        do {
            cards = try context.fetch(descriptor)
            print("Fetched \(cards.count) cards")
        } catch {
            print("Failed to fetch cards: \(error)")
            cards = []
        }
    }
    
    func selectRandomCard() {
        guard !cards.isEmpty else {
            currentCard = nil
            translationIsShown = false
            return
        }
        
        let totalWeight = cards.reduce(0) { $0 + ($1.rating ?? 1) }
        guard totalWeight > 0 else {
            currentCard = cards.randomElement()
            return
        }
        
        var randomWeight = Int.random(in: 1...totalWeight)
        
        for card in cards {
            randomWeight -= card.rating ?? 1
            if randomWeight <= 0 {
                currentCard = card
                break
            }
        }
        
        translationIsShown = false
    }
    
    func showTranslation() {
        translationIsShown = true
    }
    
    func updateRatingAndNextCard(isEasy: Bool) {
        updateRating(isEasy: isEasy)
        selectRandomCard()
    }
    
    private func updateRating(isEasy: Bool) {
        guard let currentCardId = currentCard?.id,
              let index = cards.firstIndex(where: { $0.id == currentCardId }),
              let context = modelContext else {
            return
        }
        
        if isEasy {
            cards[index].rating = max(0, (cards[index].rating ?? 1) - 1)
        } else {
            cards[index].rating = (cards[index].rating ?? 1) + 1
        }
        
        do {
            try context.save()
            print("Updated rating for card: \(String(describing: cards[index].foreignWord)), new rating: \(cards[index].rating ?? 0)")
        } catch {
            print("Failed to save context: \(error)")
        }
        
        fetchCards()
    }
}
