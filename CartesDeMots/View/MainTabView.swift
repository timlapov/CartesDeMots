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
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
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
        .onAppear {
            if let firstSettings = settings.first {
                activeTab = firstSettings.mainTab
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Card.self, Resource.self, Settings.self])
}

