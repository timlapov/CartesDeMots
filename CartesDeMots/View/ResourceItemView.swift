//
//  ResourceItemView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import SwiftUI

struct ResourceItemView: View {
    
    @State private var offset: CGFloat = 0
    @State private var isDragging = false
    @State private var dragThreshold: CGFloat = 10
    
    var onDelete: () -> Void
    var resource: Resource
    
    var body: some View {
        ZStack {

            if offset < 0 {
                deleteBackground()
                    .transition(.opacity)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text(resource.title ?? "")
                        .bold()
                    Divider()
                    Link(resource.link ?? "", destination: URL(string: resource.link ?? "lapov.art")!)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(cardBackground())
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 7, x:  2, y: 2)
            .offset(x: offset)
        }
        .gesture(
            DragGesture()
                .onChanged(onChanged)
                .onEnded(onEnded)
        )
        .animation(.spring(), value: offset)
    }
    
    private func deleteBackground() -> some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "trash")
                    .font(.title)
                if -offset > UIScreen.main.bounds.width * 0.15 {
                    Text("Swipe to delete")
                        .font(.caption)
                }
            }
            .foregroundColor(.white)
            .frame(width: -offset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.8))
        .cornerRadius(10)
    }
    
    private func cardBackground() -> some View {
        GlassView()
            .background(
                Color.white.opacity(0.2)
                    .overlay(
                        Color.red.opacity(offset < 0 ? -offset / UIScreen.main.bounds.width * 0.5 : 0)
                    )
            )
    }
    
    private func onChanged(_ value: DragGesture.Value) {
        
        if abs(value.translation.width) > dragThreshold {
                isDragging = true
            }
        
        if isDragging && value.translation.width < 0 {
            offset = value.translation.width
        }
    }
    
    private func onEnded(_ value: DragGesture.Value) {
        isDragging = false
        
        
        withAnimation(.spring()) {
            if -offset > UIScreen.main.bounds.width * 0.6 {
                offset = -UIScreen.main.bounds.width
                hapticNotification(.warning)
                onDelete()
            } else {
                offset = 0
            }
        }
    }
}

#Preview {
    ResourcesView()
        .modelContainer(for: Resource.self)
}
