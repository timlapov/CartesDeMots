//
//  HowToUseView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/01/2026.
//

import SwiftUI

struct HowToUseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                instructionSection(
                    icon: "square.2.layers.3d",
                    title: NSLocalizedString("howto_cards_title", comment: ""),
                    description: NSLocalizedString("howto_cards_description", comment: "")
                )

                instructionSection(
                    icon: "square.3.layers.3d.down.right",
                    title: NSLocalizedString("howto_learn_title", comment: ""),
                    description: NSLocalizedString("howto_learn_description", comment: "")
                )

                instructionSection(
                    icon: "link.icloud",
                    title: NSLocalizedString("howto_resources_title", comment: ""),
                    description: NSLocalizedString("howto_resources_description", comment: "")
                )

                instructionSection(
                    icon: "icloud",
                    title: NSLocalizedString("howto_gestures_title", comment: ""),
                    description: NSLocalizedString("howto_gestures_description", comment: "")
                )

                instructionSection(
                    icon: "star",
                    title: NSLocalizedString("howto_rating_title", comment: ""),
                    description: NSLocalizedString("howto_rating_description", comment: "")
                )
            }
            .padding()
        }
        .navigationTitle("How to Use")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func instructionSection(icon: String, title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: icon)
                .font(.headline)

            Text(description)
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        HowToUseView()
    }
}
