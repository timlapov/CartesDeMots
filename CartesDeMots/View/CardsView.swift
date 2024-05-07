//
//  ListView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI

struct ListView: View {
    @State var search = ""
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $search)
                    }
                    .padding()
                    .background {
                        GlassView()
                        Color.gray.opacity(0.1)
                    }
                    .clipShape(Capsule())
                    Button(action: { }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding()
                            .background {
                                Circle()
                                    .fill(.orange)
                                    .opacity(0.95)
                            }
                            //.shadow(radius: 7)
                    })
//                    Button(action: { }, label: {
//                        Image(systemName: "plus")
//                            .padding()
//                            .foregroundColor(.white)
//                            .background {
//                                GlassView()
//                                    .background(.orange)
//                                    .opacity(0.8)
//                                    .clipShape(Circle())
//                            }
//                            .shadow(radius: 7)
//                    })
                }
                .padding(.horizontal)

                
                ScrollView {
                    
                    VStack {
                        
                        CardItemView()
                        CardItemView()
                        CardItemView()
                        CardItemView()
                        
                    }
                }
            }
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
