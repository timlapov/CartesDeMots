//
//  NewWordView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI
import SwiftData

struct NewWordView: View {
    @Query(sort: [SortDescriptor(\Card.addDate, order: .reverse)], animation: .default) private var cards: [Card]
    @Environment(\.modelContext) private var modelContext
    
    @ObservedObject var cardsViewModel: CardsViewModel
    
    @State private var word = ""
    @State private var translation = ""
    @State private var comment = ""
    
    private var isButtonDisabled: Bool {
        word.count < 2 || translation.count < 2 ? true : false
    }
    
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
                let card = Card(foreignWord: word, translation: translation, comment: comment)
                modelContext.insert(card)
                cardsViewModel.addViewHandler = nil
            }, label: {
                Text("Add the word")
                    .padding()
                    .foregroundStyle(.white)
                    .bold()
                    .background {
                        isButtonDisabled ? Color.gray : Color.orange
                    }
                    .clipShape(Capsule())
            })
            .padding(.top)
            .disabled(isButtonDisabled)
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
