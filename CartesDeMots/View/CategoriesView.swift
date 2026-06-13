//
//  CategoriesView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 12/06/2026.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Query(sort: [SortDescriptor(\Category.name)], animation: .default) private var categories: [Category]
    @Environment(\.modelContext) private var modelContext

    @ObservedObject var cardsViewModel: CardsViewModel

    @State private var newCategoryName = ""
    @State private var categoryToRename: Category?
    @State private var renameText = ""
    @State private var categoryToDelete: Category?

    private var trimmedNewName: String {
        newCategoryName.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var isAddDisabled: Bool {
        trimmedNewName.isEmpty || nameExists(trimmedNewName)
    }

    var body: some View {
        VStack {
            HStack {
                Text("Categories")
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

            HStack(alignment: .bottom) {
                GlassTextFieldView(text: $newCategoryName, placeholder: NSLocalizedString("New category", comment: "New category"))
                Button(action: {
                    addCategory()
                }, label: {
                    if #available(iOS 26.0, *) {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundStyle(isAddDisabled ? .gray : .orange)
                            .bold()
                            .glassEffect(in: .capsule)
                    } else {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundStyle(.white)
                            .bold()
                            .background {
                                isAddDisabled ? Color.gray : Color.orange
                            }
                            .clipShape(Capsule())
                    }
                })
                .disabled(isAddDisabled)
            }

            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(spacing: 10) {
                    ForEach(categories) { category in
                        HStack {
                            Image(systemName: "folder")
                                .foregroundStyle(.orange)
                            Text(category.name ?? "")
                                .lineLimit(1)
                            Spacer()
                            Text("\(category.cards?.count ?? 0)")
                                .foregroundStyle(.gray)
                                .font(.footnote)
                            Button(action: {
                                hapticSelection()
                                renameText = category.name ?? ""
                                categoryToRename = category
                            }, label: {
                                Image(systemName: "pencil")
                                    .foregroundStyle(.orange)
                                    .padding(6)
                            })
                            .buttonStyle(.plain)
                            Button(action: {
                                hapticSelection()
                                categoryToDelete = category
                            }, label: {
                                Image(systemName: "trash")
                                    .foregroundStyle(.red)
                                    .padding(6)
                            })
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background {
                            GlassView()
                                .background(.white.opacity(0.4))
                        }
                        // Капсула вместо прямоугольника со скруглением — единый стиль обрезки во всём приложении.
                        .clipShape(Capsule())
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
            .scrollDismissesKeyboard(.immediately)

            if categories.isEmpty {
                Spacer()
                Text("No categories yet")
                    .foregroundStyle(.gray)
                Spacer()
            }
        }
        .padding()
        .background {
            Image("bgAdd")
        }
        .alert("Rename category", isPresented: Binding(
            get: { categoryToRename != nil },
            set: { newValue in
                if !newValue {
                    categoryToRename = nil
                }
            }
        )) {
            TextField(NSLocalizedString("New category", comment: "New category"), text: $renameText)
            Button("Cancel", role: .cancel) {
                categoryToRename = nil
            }
            Button("Rename") {
                renameCategory()
            }
        }
        .confirmationDialog(
            String(format: NSLocalizedString("Delete category \"%@\"?", comment: "Delete category"), categoryToDelete?.name ?? ""),
            isPresented: Binding(
                get: { categoryToDelete != nil },
                set: { newValue in
                    if !newValue {
                        categoryToDelete = nil
                    }
                }
            ),
            titleVisibility: .visible
        ) {
            Button("Delete", role: .destructive) {
                deleteCategory()
            }
            Button("Cancel", role: .cancel) {
                categoryToDelete = nil
            }
        } message: {
            Text("The words will be kept without a category")
        }
    }

    private func nameExists(_ name: String) -> Bool {
        categories.contains { ($0.name ?? "").caseInsensitiveCompare(name) == .orderedSame }
    }

    private func addCategory() {
        guard !isAddDisabled else { return }
        let category = Category(name: trimmedNewName)
        modelContext.insert(category)
        newCategoryName = ""
        hapticNotification(.success)
    }

    private func renameCategory() {
        let trimmed = renameText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let category = categoryToRename, !trimmed.isEmpty, !nameExists(trimmed) else {
            categoryToRename = nil
            return
        }
        category.name = trimmed
        categoryToRename = nil
        hapticNotification(.success)
    }

    private func deleteCategory() {
        guard let category = categoryToDelete else { return }
        withAnimation(.spring()) {
            modelContext.delete(category)
        }
        categoryToDelete = nil
        hapticNotification(.success)
    }

    private func dismissView() {
        cardsViewModel.categoriesViewHandler = nil
    }
}

#Preview {
    CategoriesView(cardsViewModel: CardsViewModel())
        .modelContainer(for: [Card.self, Category.self, Resource.self, Settings.self])
}
