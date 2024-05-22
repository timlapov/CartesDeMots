//
//  NewLinkView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct NewLinkView: View {
    @ObservedObject var resourcesViewModel: ResourcesViewModel
    @State var description = ""
    @State var link = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Text("New resource link")
                Spacer()
                Button(action: {
                    resourcesViewModel.addViewHandler = nil
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.orange)
                })
            }
            .font(.title)
            .bold()
            .fontDesign(.rounded)
            
            Spacer()
            
            GlassTextFieldView(text: $description, placeholder: "Description")
            
            GlassTextFieldView(text: $link, placeholder: "Link")
            
            Button(action: {
                
            }, label: {
                Text("Add the link")
                    .padding()
                    .foregroundStyle(.white)
                    .bold()
                    .background {
                        Color.orange
                    }
                    .clipShape(Capsule())
            })
            .padding(.top)
            
            Spacer()
            
        }
        .padding()
        .background {
            Image("bgAdd")
        }
        
    }
}

#Preview {
    NewLinkView(resourcesViewModel: ResourcesViewModel())
}
