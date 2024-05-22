//
//  FlagPickerView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 08/05/2024.
//

import Foundation
import SwiftUI

struct FlagPickerView: View {
    let flags = ["🇬🇧", "🇪🇸", "🇫🇷", "🇩🇪", "🇵🇹", "🏳️", "🇷🇺", "🇨🇳", "🇸🇦", "🇯🇵", "🇮🇳"]
    @State private var selectedFlag = "🏳️"

    var body: some View {
        VStack {
            Picker("Choose your flag", selection: $selectedFlag) {
                ForEach(flags, id: \.self) { flag in
                    Text(flag).tag(flag)
                }
            }
            .pickerStyle(.palette)
            .padding()
        }
    }
}

#Preview {
    FlagPickerView()
}
