//
//  ResourceItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct ResourceItemView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("Описание ресурса")
                    .bold()
                Divider()
                Text("https://www.google.fr")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background {
            GlassView()
        }
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 7)
        .padding(.horizontal)
    }
}

#Preview {
    ResourceItemView()
}
