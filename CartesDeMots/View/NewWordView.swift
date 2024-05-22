//
//  NewWordView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct NewWordView: View {
    @ObservedObject var cardsViewModel: CardsViewModel
    @State var word = ""
    @State var translation = ""
    @State var comment = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Text("New word")
                Spacer()
                Button(action: {
                    cardsViewModel.addViewHandler = nil
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.orange)
                })
            }
            .font(.title)
            .bold()
            .fontDesign(.rounded)
            
            Spacer()
            
            GlassTextFieldView(text: $word, placeholder: "Foreign word")
            
            GlassTextFieldView(text: $translation, placeholder: "Translation")
            
            GlassTextFieldView(text: $comment, placeholder: "Comment")
            
            Button(action: {

            }, label: {
                Text("Add the word")
                    .padding()
                    .foregroundStyle(.white)
                    .bold()
                    .background {
                        Color.orange
                    }
                    .clipShape(Capsule())
            })
            .padding(.top)
        }
        .padding()
        .background {
            Image("bgAdd")
        }
    }
}

#Preview {
    NewWordView(cardsViewModel: CardsViewModel())
}
