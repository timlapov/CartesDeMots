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
        TabView(selection: $activeTab) {
            CardsView()
                .tabItem {
                    Label(Tab.words.localizedName, systemImage: Tab.words.image)
                }
                .tag(Tab.words)
            
            LearnView()
                .tabItem {
                    Label(Tab.learn.localizedName, systemImage: Tab.learn.image)
                }
                .tag(Tab.learn)
            
            ResourcesView()
                .tabItem {
                    Label(Tab.resources.localizedName, systemImage: Tab.resources.image)
                }
                .tag(Tab.resources)
            
            SettingsView()
                .tabItem {
                    Label(Tab.settings.localizedName, systemImage: Tab.settings.image)
                }
                .tag(Tab.settings)
        }
        .tint(.orange)
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
                ForEach(Tab.allCases, id: \.self) {tab in
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

