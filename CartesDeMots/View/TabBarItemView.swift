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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Button {
                withAnimation(.interactiveSpring(response: 0.6,
                                                 dampingFraction: 0.6,
                                                 blendDuration: 0.6)) {
                    activeTab = tab
                    hapticSelection()
                }
            } label: {
                HStack {
                    Image(systemName: tab.image)
                        //.resizable()
                        .font(.title2)
                        .frame(width: 20, height: 20)
                    if activeTab == tab {
                        Text(tab.localizedName)
                            .font(.title3)
                            .fontDesign(.rounded)
                            .bold()
                    }
                }
               .foregroundColor(activeTab == tab ? (colorScheme == .dark ? .white : .black) : .gray)
            }
        }
    }
}

