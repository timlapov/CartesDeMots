//
//  MainTabView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI
import SwiftData

struct MainTabView: View {

    @Query private var settings: [Settings]

    @State private var activeTab = Tab.words
    @State private var searchText = ""

    init() {
        if #unavailable(iOS 26) {
            UITabBar.appearance().isHidden = true
        }
    }

    var body: some View {
        Group {
            if #available(iOS 26, *) {
                modernTabView
            } else {
                legacyTabView
            }
        }
        .onAppear {
            if let firstSettings = settings.first {
                activeTab = firstSettings.mainTab
            }
        }
    }

    // MARK: - iOS 26+ (LiquidGlass)
    @available(iOS 26, *)
    private var modernTabView: some View {
        TabView {
            SwiftUI.Tab(Tab.words.localizedName, systemImage: Tab.words.image) {
                CardsView()
            }

            SwiftUI.Tab(Tab.learn.localizedName, systemImage: Tab.learn.image) {
                LearnView()
            }

            SwiftUI.Tab(Tab.resources.localizedName, systemImage: Tab.resources.image) {
                ResourcesView()
            }

            SwiftUI.Tab(Tab.settings.localizedName, systemImage: Tab.settings.image) {
                SettingsView()
            }

            SwiftUI.Tab(NSLocalizedString("tab_search", comment: ""), systemImage: "magnifyingglass", role: .search) {
                NavigationStack {
                    SearchView(searchText: $searchText)
                        //.navigationTitle(NSLocalizedString("tab_search", comment: ""))
                }
            }
        }
        .searchable(text: $searchText)
        .tint(.orange)
        .tabBarMinimizeBehavior(.onScrollDown)
    }

    // MARK: - iOS 18 and earlier (Custom TabBar)
    private var legacyTabView: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab,
                        content:  {
                    CardsView()
                        .tag(Tab.words)
                    LearnView()
                        .tag(Tab.learn)
                    ResourcesView()
                        .tag(Tab.resources)
                    SettingsView()
                        .tag(Tab.settings)
                })

            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Spacer()
                    TabBarItemView(tab: tab, activeTab: $activeTab)
                    Spacer()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                GlassView()
                    .clipShape(Capsule())
                    .padding(.horizontal)
                Capsule()
                    .foregroundColor(.gray.opacity(0.2))
                    .shadow(radius: 7)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}

