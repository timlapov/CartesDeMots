//
//  CardItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI

struct CardItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("🇫🇷")
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(.all, 0)
            }
            Text("Une Voiture")
                .padding(.top, 0)
                .font(.headline)
            Text("Автомобиль")
                .padding(.top, 1)
            Divider()
            Text("Комментарии")
                .font(.subheadline)
                .foregroundStyle(.gray)
            Text("Текст комментария Текст комментария Текст комментария Текст комментария")
                .padding(.top, 2)
        }
        .padding()
        .background(Color(.gray).opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

#Preview {
    CardItemView()
}
