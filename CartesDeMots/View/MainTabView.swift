//
//  MainTabView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var activeTab = Tab.cards
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab,
                        content:  {
                    CardsView()
                        .tag(Tab.cards)
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
                Capsule()
                    .foregroundColor(.white)
                    .shadow(radius: 7)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MainTabView()
}

