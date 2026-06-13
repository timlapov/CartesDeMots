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
    @Query(sort: [SortDescriptor(\Category.name)], animation: .default) private var categories: [Category]
    
    @State private var offset: CGFloat = 0
    @State private var backgroundColor: Color = .clear
    @State private var isCardVisible = true
    @State private var language: String = "🏳️"

    /// Выбранная категория, общая с главным экраном (CardsView) через UserDefaults; пусто = все слова.
    @AppStorage(AppStorageKeys.selectedCategoryID) private var selectedCategoryIDRaw: String = ""
    private var selectedCategoryID: UUID? {
        selectedCategoryIDRaw.isEmpty ? nil : UUID(uuidString: selectedCategoryIDRaw)
    }

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    /// Та же высота, что и у пикера на главном экране (CardsView), чтобы контролы совпадали.
    private let controlHeight: CGFloat = 48

    var body: some View {
        VStack {
            if !categories.isEmpty {
                HStack {
                    Menu {
                        Button(action: {
                            hapticSelection()
                            selectedCategoryIDRaw = ""
                        }, label: {
                            if viewModel.selectedCategoryID == nil {
                                Label("All words", systemImage: "checkmark")
                            } else {
                                Text("All words")
                            }
                        })
                        Divider()
                        ForEach(categories) { category in
                            Button(action: {
                                hapticSelection()
                                selectedCategoryIDRaw = category.id?.uuidString ?? ""
                            }, label: {
                                if viewModel.selectedCategoryID == category.id {
                                    Label(category.name ?? "", systemImage: "checkmark")
                                } else {
                                    Text(category.name ?? "")
                                }
                            })
                        }
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "folder")
                                .foregroundStyle(.orange)
                            Text(selectedCategoryName)
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
                }
            }

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
                                // Символ языка убран и здесь (как на карточках). language/loadLanguageSetting
                                // оставлены для возможного возврата; Settings.language не трогаем.
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
        // Без верхнего отступа: пикер встаёт флешем к сейф-зоне, на одной высоте с главным экраном.
        // Горизонтальные поля и нижний отступ — как были (раскладку карточек не трогаем).
        .padding([.horizontal, .bottom])
        .background {
            Image("bgLearn")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .onAppear {
            // Подхватываем выбор, сделанный на главном экране, до первой загрузки колоды.
            viewModel.selectedCategoryID = selectedCategoryID
            viewModel.setModelContext(modelContext)
            loadLanguageSetting()
        }
        .onChange(of: selectedCategoryIDRaw) {
            // Категорию сменили (здесь или на главном экране) — переустанавливаем колоду под неё.
            viewModel.selectCategory(selectedCategoryID)
        }
        .onChange(of: categories) {
            // Если выбранную категорию удалили — сбрасываем общий выбор (вернёт оба экрана к «Все слова»).
            if let selectedID = viewModel.selectedCategoryID,
               !categories.contains(where: { $0.id == selectedID }) {
                selectedCategoryIDRaw = ""
            }
        }
    }

    private var selectedCategoryName: String {
        if let selectedID = viewModel.selectedCategoryID,
           let category = categories.first(where: { $0.id == selectedID }) {
            return category.name ?? ""
        }
        return NSLocalizedString("All words", comment: "All words")
    }

    private func loadLanguageSetting() {
        if let firstSettings = settings.first {
            language = firstSettings.language ?? "🏳️"
        }
    }
}

#Preview {
    LearnView()
        .modelContainer(for: [Card.self, Category.self, Resource.self, Settings.self])
}
