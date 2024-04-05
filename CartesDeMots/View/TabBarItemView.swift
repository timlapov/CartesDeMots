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
                .frame(height: activeTab == tab ? 35 : 30)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .padding(13)
                .foregroundColor(activeTab == tab ? .orange : .white)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "ID", in: animation)
                    }
                }
//                .offset(y: activeTab == tab ? -1 : 0)
        }
    }
}
