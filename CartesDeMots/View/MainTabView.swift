//
//  MainTabView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var activeTab = Tab.list
    
    @Namespace private var animation
    
    var body: some View {
            TabView(selection: $activeTab,
                    content:  {
                ListView()
                    .tag(Tab.list)
                    .toolbar(.hidden, for: .tabBar)
                CardsView()
                    .tag(Tab.cards)
                    .toolbar(.hidden, for: .tabBar)
                ResourcesView()
                    .tag(Tab.resources)
                    .toolbar(.hidden, for: .tabBar)
                SettingsView()
                    .tag(Tab.settings)
                    .toolbar(.hidden, for: .tabBar)
            })
        //TODO: найти более изящное решение
            .id(UUID())
        
        customTabBar()
    }
    
    @ViewBuilder
    func customTabBar() -> some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabBarItemView(tab: tab, animation: animation, activeTab: $activeTab)
                    .onTapGesture {
                        activeTab = tab
                    }
            }
        }
        .padding(.top, 5)
        .background {
            Rectangle()
                .fill(.orange)
                .ignoresSafeArea()
//                .shadow(radius: 10)
//                .blur(radius: 2.0)
        }
        .animation(.interactiveSpring(
            response: 0.2,
            dampingFraction: 0.35,
            blendDuration: 0.6
        ), value: activeTab)
        
    }
}

#Preview {
    MainTabView()
}
