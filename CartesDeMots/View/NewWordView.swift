//
//  NewWordView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI
import SwiftData

struct NewWordView: View {
    @Query(sort: [SortDescriptor(\Card.addDate, order: .reverse)], animation: .default) private var cards: [Card]
    @Environment(\.modelContext) private var modelContext
    
    @ObservedObject var cardsViewModel: CardsViewModel
    
    var existingCard: Card? = nil
    
    @State private var word = ""
    @State private var translation = ""
    @State private var comment = ""
    
    private var isButtonDisabled: Bool {
        word.count < 1 || translation.count < 1 ? true : false
    }
    
    private var isEditMode: Bool {
        existingCard != nil
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text(isEditMode ? "Edit word" : "New word")
                Spacer()
                if #available(iOS 26.0, *) {
                    Button(action: {
                        hapticSelection()
                        dismissView()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.orange)
                    })
                    .buttonStyle(.glass)
                } else {
                    Button(action: {
                        hapticSelection()
                        dismissView()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.orange)
                    })
                }
            }
                    .font(.title)
                    .bold()
                    .fontDesign(.rounded)
            
            Spacer()
            
            GlassTextFieldView(text: $word, placeholder: NSLocalizedString("Foreign word", comment: "Foreign word"))
            
            GlassTextFieldView(text: $translation, placeholder: NSLocalizedString("Translation", comment: "Translation"))
            
            GlassTextFieldView(text: $comment, placeholder: NSLocalizedString("Comment", comment: "Comment"))
            
            Button(action: {
                if isEditMode {
                    updateCard()
                } else {
                    addCard()
                }
            }, label: {
                if #available(iOS 26.0, *) {
                    Text(isEditMode ? "Update the word" : "Add the word")
                        .padding()
                        .foregroundStyle(isButtonDisabled ? .gray :.orange)
                        .bold()
                        .glassEffect(in: .capsule)
                } else {
                    Text(isEditMode ? "Update the word" : "Add the word")
                        .padding()
                        .foregroundStyle(.white)
                        .bold()
                        .background {
                            isButtonDisabled ? Color.gray : Color.orange
                        }
                        .clipShape(Capsule())
                }
            })
            .padding(.top)
            .disabled(isButtonDisabled)
        }
        .padding()
        .background {
            Image("bgAdd")
        }
        .onAppear {
            loadExistingCard()
        }
    }
    
    private func loadExistingCard() {
        if let card = existingCard {
            word = card.foreignWord ?? ""
            translation = card.translation ?? ""
            comment = card.comment ?? ""
        }
    }
    
    private func addCard() {
        let card = Card(foreignWord: word, translation: translation, comment: comment)
        modelContext.insert(card)
        hapticNotification(.success)
        dismissView()
    }
    
    private func updateCard() {
        guard let card = existingCard else { return }
        card.foreignWord = word
        card.translation = translation
        card.comment = comment
        hapticNotification(.success)
        dismissView()
    }
    
    private func dismissView() {
        cardsViewModel.addViewHandler = nil
        cardsViewModel.editCardHandler = nil
    }
}

//#Preview {
//    NewWordView(cardsViewModel: CardsViewModel())
//}
