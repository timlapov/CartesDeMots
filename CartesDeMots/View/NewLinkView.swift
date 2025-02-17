//
//  NewLinkView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct NewLinkView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var resourcesViewModel: ResourcesViewModel
    @State var title = ""
    @State var link = "https://"
    
    private var isButtonDisabled: Bool {
        title.count < 2 || link.count < 2 ? true : false
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text("New resource link")
                Spacer()
                Button(action: {
                    hapticSelection()
                    resourcesViewModel.addViewHandler = nil
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.orange)
                })
                .disabled(isButtonDisabled)
            }
            .font(.title)
            .bold()
            .fontDesign(.rounded)
            
            Spacer()
            
            GlassTextFieldView(text: $title, placeholder: NSLocalizedString("Title", comment: "linkTitle"))
            
            GlassTextFieldView(text: $link, placeholder: NSLocalizedString("Link", comment: "link"))
            
            Button(action: {
                let resource = Resource(title: title, link: link)
                modelContext.insert(resource)
                hapticNotification(.success)
                resourcesViewModel.addViewHandler = nil
            }, label: {
                Text("Add the link")
                    .padding()
                    .foregroundStyle(.white)
                    .bold()
                    .background {
                        isButtonDisabled ? Color.gray : Color.orange
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
