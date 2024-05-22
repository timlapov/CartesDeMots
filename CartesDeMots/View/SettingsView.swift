//
//  SettingsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        VStack {
            
            FlagPickerView()
                .padding(.bottom, 0)
            
            Text("Select the language you are learning. Its flag will appear on the cards")
                .padding(.top, 0)
            
        }
        .background {
            Image("bgSettings")
    }
        
    }
    
}

#Preview {
    SettingsView()
}
