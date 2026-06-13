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
    @Query(sort: [SortDescriptor(\Category.name)], animation: .default) private var categories: [Category]
    @Environment(\.modelContext) private var modelContext

    @ObservedObject var cardsViewModel: CardsViewModel

    var existingCard: Card? = nil
    var preselectedCategory: Category? = nil

    @State private var word = ""
    @State private var translation = ""
    @State private var comment = ""
    @State private var selectedCategoryID: UUID?

    private var selectedCategory: Category? {
        guard let selectedCategoryID else { return nil }
        return categories.first { $0.id == selectedCategoryID }
    }
    
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

            if !categories.isEmpty {
                // Стекло вынесено внутрь label (см. categoryMenu), а не на весь Menu.
                // Иначе при смене категории computed-свойство categoryMenu пересоздавалось целиком,
                // стеклянный слой переинициализировался — и контрол на миг становился непрозрачным.
                categoryMenu
                    .padding(.top, 20)
            }

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
    
    private var categoryMenu: some View {
        Menu {
            Button(action: {
                hapticSelection()
                selectedCategoryID = nil
            }, label: {
                if selectedCategory == nil {
                    Label("No category", systemImage: "checkmark")
                } else {
                    Text("No category")
                }
            })
            Divider()
            ForEach(categories) { category in
                Button(action: {
                    hapticSelection()
                    selectedCategoryID = category.id
                }, label: {
                    if selectedCategoryID == category.id {
                        Label(category.name ?? "", systemImage: "checkmark")
                    } else {
                        Text(category.name ?? "")
                    }
                })
            }
        } label: {
            HStack {
                Image(systemName: "folder")
                    .foregroundStyle(.orange)
                Text(selectedCategory?.name ?? NSLocalizedString("No category", comment: "No category"))
                    .foregroundStyle(selectedCategory == nil ? Color.gray : Color.primary)
                Spacer()
                Image(systemName: "chevron.up.chevron.down")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding()
            .glassCapsule()
        }
        .buttonStyle(.plain)
    }

    private func loadExistingCard() {
        if let card = existingCard {
            word = card.foreignWord ?? ""
            translation = card.translation ?? ""
            comment = card.comment ?? ""
            selectedCategoryID = card.category?.id
        } else {
            selectedCategoryID = preselectedCategory?.id
        }
    }

    private func addCard() {
        let card = Card(foreignWord: word, translation: translation, comment: comment, category: selectedCategory)
        modelContext.insert(card)
        hapticNotification(.success)
        dismissView()
    }

    private func updateCard() {
        guard let card = existingCard else { return }
        card.foreignWord = word
        card.translation = translation
        card.comment = comment
        card.category = selectedCategory
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
