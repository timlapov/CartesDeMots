//
//  TabBarItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct TabBarItemView: View {
    var tab: Tab
    @Binding var activeTab: Tab
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.interactiveSpring(response: 0.6,
                                                 dampingFraction: 0.6,
                                                 blendDuration: 0.6)) {
                    activeTab = tab
                }
            } label: {
                HStack {
                    Image(systemName: tab.image)
                        .resizable()
                        .frame(width: 20, height: 20)
                    if activeTab == tab {
                        Text(tab.rawValue)
                            .font(.title3)
                    }
                }
                .foregroundColor(activeTab == tab ? .white : .black)
            }

        }
    }
}

