//
//  ContentView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            MainTabView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Card.self, Category.self, Resource.self, Settings.self])
}
