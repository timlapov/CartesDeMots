//
//  GlassTextFieldView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct GlassTextFieldView: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background {
                GlassView()
                    .background(.white.opacity(0.4))
            }
           // .clipShape(Capsule())
           // .shadow(radius: 7)
            .cornerRadius(10)
            .padding(.top, 30)
    }
}

#Preview {
    GlassTextFieldView(text: .constant(""), placeholder: "placeholder")
}
