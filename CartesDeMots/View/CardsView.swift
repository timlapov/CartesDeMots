//
//  ListView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct CardsView: View {
    @State var search = ""
    
    @ObservedObject var cardsViewModel = CardsViewModel()
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $search)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 7)
                    .background {
                        GlassView()
                        Color.gray.opacity(0.1)
                    }
                    .clipShape(Capsule())
                    Button(action: { 
                        cardsViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(7)
                            .background {
                                Circle()
                                    .fill(.orange)
                                    .opacity(0.95)
                            }
                            //.shadow(radius: 7)
                    })
                }
                .padding(.horizontal)
                
                ScrollView {
                    
                    VStack {
                        
                        CardItemView {
                            //
                        }
                        
                        CardItemView {
                            //
                        }
                        
                        CardItemView {
                            //
                        }
                        
                        CardItemView {
                            //
                        }
                        
                    }
                    
                }
            }
        }
        .sheet(item: $cardsViewModel.addViewHandler) {_ in 
            NewWordView(cardsViewModel: cardsViewModel)
        }
        .background {
            Image("bgList")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }

    }
}

#Preview {
    ContentView()
}

extension View {
    func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as?
                UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}
