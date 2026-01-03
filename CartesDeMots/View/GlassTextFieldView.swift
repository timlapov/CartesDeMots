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
        if #available(iOS 26, *) {
            TextField(placeholder, text: $text)
                .padding()
                .glassEffect(in: .capsule)
                .padding(.top, 20)
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background {
                    GlassView()
                        .background(.white.opacity(0.4))
                }
                .cornerRadius(10)
                .padding(.top, 30)
        }
    }
    

}

#Preview {
    GlassTextFieldView(text: .constant(""), placeholder: "placeholder")
}
