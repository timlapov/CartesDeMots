//
//  ResourcesView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI

struct ResourcesView: View {
    
    @ObservedObject var resourcesViewModel = ResourcesViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                
                Button(action: {
                    resourcesViewModel.addViewHandler = ModalHandler()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    GlassView()
                }
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 15)
                .shadow(color: .black.opacity(0.1), radius: 7)
                .contentShape(Rectangle())
                
                    ResourceItemView()
                    ResourceItemView()
                    ResourceItemView()
                    ResourceItemView()
                    ResourceItemView()
                                
                }
                .background {
                    Image("bgResources")
            }
        }
        .sheet(item: $resourcesViewModel.addViewHandler) {_ in
            NewLinkView(resourcesViewModel: resourcesViewModel)
        }
    }
}

#Preview {
    ResourcesView()
}
