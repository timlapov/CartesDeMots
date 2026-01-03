//
//  ResourcesView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI
import SwiftData

struct ResourcesView: View {
    @Query(sort: [SortDescriptor(\Resource.addDate, order: .reverse)], animation: .default) private var resources: [Resource]
    
    @Environment(\.modelContext) private var modelContext
    
    @ObservedObject var resourcesViewModel = ResourcesViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Useful links")
                    .font(.title)
                    .fontDesign(.rounded)
                    .bold()
                Spacer()
                if #available(iOS 26, *) {
                    Button(action: {
                        hapticSelection()
                        resourcesViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .padding(3)
                    })
                    .buttonStyle(.glassProminent)
                    .tint(Color(.orange))
                } else {
                    Button(action: {
                        hapticSelection()
                        resourcesViewModel.addViewHandler = ModalHandler()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(7)
                            .background {
                                Circle()
                                    .fill(.orange)
                                    .opacity(0.95)
                            }
                    })
                    .buttonStyle(.plain)
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom, -7)

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(resources) { resource in
                        ResourceItemView(onDelete: {
                            modelContext.delete(resource)
                        }, resource: resource)
                        .padding(.horizontal)
                        .padding(.top, 7)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .background {
            Image("bgResources")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(item: $resourcesViewModel.addViewHandler) {_ in
            NewLinkView(resourcesViewModel: resourcesViewModel)
        }
    }
}

#Preview {
    ResourcesView()
        .modelContainer(for: Resource.self)
}
