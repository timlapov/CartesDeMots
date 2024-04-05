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
        VStack{
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $search)
                }
                .padding()
                .background {
                    Capsule()
                        .fill(.gray)
                        .opacity(0.2)
                }
                Button(action: { }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Circle()
                                .fill(.orange)
                        }
                })
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
}

#Preview {
    ContentView()
}
