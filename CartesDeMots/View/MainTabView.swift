//
//  MainTabView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var activeTab = Tab.list
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $activeTab,
                        content:  {
                    ListView()
                        .tag(Tab.list)
                    CardsView()
                        .tag(Tab.cards)
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
                    .foregroundColor(.gray.opacity(0.9))
                    .blur(radius: 3.0)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MainTabView()
}

