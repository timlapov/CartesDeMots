//
//  TabBarItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct TabBarItemView: View {
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    
    var body: some View {
        VStack {
            Image(systemName: tab.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: activeTab == tab ? 50 : 40)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .padding(12)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(Color.brown)
                            .matchedGeometryEffect(id: "ID", in: animation)
                    }
                }
                .offset(y: activeTab == tab ? -1 : 0)
            Text(tab.rawValue)
        }
    }
}
