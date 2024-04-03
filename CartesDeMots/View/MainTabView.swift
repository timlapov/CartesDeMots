//
//  MainTabView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var activeTab = Tab.cards
    
    @Namespace private var animation
    
    var body: some View {
            TabView(selection: $activeTab,
                    content:  {
                Text("List")
                    .tag(Tab.list)
                    .toolbar(.hidden, for: .tabBar)
                Text("Cards")
                    .tag(Tab.cards)
                    .toolbar(.hidden, for: .tabBar)
                Text("Resources")
                    .tag(Tab.resources)
                    .toolbar(.hidden, for: .tabBar)
            })
        
        //TODO: custom tabbar
        customTabBar()
    }
    @ViewBuilder
    func customTabBar() -> some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                //TODO: do item
                TabBarItemView(tab: tab, animation: animation, activeTab: $activeTab)
                    .onTapGesture {
                        activeTab = tab
                    }
            }
        }
        .padding(.top, 5)
        .background {
            Rectangle()
                .fill(.gray)
                .ignoresSafeArea()
                .shadow(radius: 10)
                .blur(radius: 1.0)
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
