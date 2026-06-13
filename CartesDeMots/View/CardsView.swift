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
    @Query(sort: [SortDescriptor(\Category.name)], animation: .default) private var categories: [Category]
    @Query private var settings: [Settings]

    @Environment(\.modelContext) private var modelContext

    @State private var language: String = "🏳️"

    /// Выбранная категория, общая с экраном тренировки (UserDefaults; пустая строка = все слова).
    @AppStorage(AppStorageKeys.selectedCategoryID) private var selectedCategoryIDRaw: String = ""
    private var selectedCategoryID: UUID? {
        selectedCategoryIDRaw.isEmpty ? nil : UUID(uuidString: selectedCategoryIDRaw)
    }

    /// Общая высота пикера и кнопки «+», чтобы они совпадали по высоте.
    private let controlHeight: CGFloat = 48

    @StateObject var cardsViewModel = CardsViewModel()

    private var selectedCategory: Category? {
        guard let selectedCategoryID else { return nil }
        return categories.first { $0.id == selectedCategoryID }
    }

    private var filteredCards: [Card] {
        guard let selectedCategory else { return cards }
        return cards.filter { $0.category?.id == selectedCategory.id }
    }

    var body: some View {
        VStack {
            HStack {
                Menu {
                    Button(action: {
                        hapticSelection()
                        selectedCategoryIDRaw = ""
                    }, label: {
                        if selectedCategory == nil {
                            Label("All words", systemImage: "checkmark")
                        } else {
                            Text("All words")
                        }
                    })
                    if !categories.isEmpty {
                        Divider()
                        ForEach(categories) { category in
                            Button(action: {
                                hapticSelection()
                                selectedCategoryIDRaw = category.id?.uuidString ?? ""
                            }, label: {
                                if selectedCategoryID == category.id {
                                    Label(category.name ?? "", systemImage: "checkmark")
                                } else {
                                    Text(category.name ?? "")
                                }
                            })
                        }
                    }
                    Divider()
                    Button(action: {
                        hapticSelection()
                        cardsViewModel.categoriesViewHandler = ModalHandler()
                    }, label: {
                        Label("Manage categories", systemImage: "folder.badge.gearshape")
                    })
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "folder")
                            .foregroundStyle(.orange)
                        Text(selectedCategory?.name ?? NSLocalizedString("All words", comment: "All words"))
                            .lineLimit(1)
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.subheadline)
                            .foregroundStyle(.orange)
                    }
                    .font(.title2)
                    .fontDesign(.rounded)
                    .bold()
                    .padding(.horizontal, 16)
                    .frame(height: controlHeight)
                    .glassCapsule()
                }
                .buttonStyle(.plain)
                Spacer()
                if #available(iOS 26, *) {
                    Button(action: {
                        hapticSelection()
                        cardsViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: controlHeight, height: controlHeight)
                            .glassEffect(.regular.tint(.orange).interactive(), in: .circle)
                    })
                    .buttonStyle(.plain)
                } else {
                    Button(action: {
                        hapticSelection()
                        cardsViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: controlHeight, height: controlHeight)
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
            NewWordView(cardsViewModel: cardsViewModel, preselectedCategory: selectedCategory)
        }
        .sheet(item: $cardsViewModel.categoriesViewHandler) { _ in
            CategoriesView(cardsViewModel: cardsViewModel)
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
        .onChange(of: categories) {
            // Если выбранную категорию удалили — сбрасываем общий выбор на «Все слова».
            if let id = selectedCategoryID, !categories.contains(where: { $0.id == id }) {
                selectedCategoryIDRaw = ""
            }
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
        .modelContainer(for: [Card.self, Category.self, Resource.self, Settings.self])
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
