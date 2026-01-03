//
//  MoreAppsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/01/2026.
//


import SwiftUI

struct MoreAppsView: View {

    private let apps: [AppInfo] = [
        AppInfo(
            name: "Le choix",
            description: NSLocalizedString("Le choix", comment: ""),
            appStoreID: "000",
            iconName: "lechoix_icon"
        )
        // Add more apps here
    ]

    var body: some View {
        List(apps) { app in
            Button {
                openAppStore(appID: app.appStoreID)
            } label: {
                HStack(spacing: 16) {
                    // App Icon
                    if let iconImage = UIImage(named: app.iconName) {
                        Image(uiImage: iconImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    } else {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(.secondary.opacity(0.3))
                            .frame(width: 60, height: 60)
                            .overlay {
                                Image(systemName: "app")
                                    .font(.title)
                                    .foregroundStyle(.secondary)
                            }
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(app.name)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(app.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }

                    Spacer()

                    Image(systemName: "arrow.up.right")
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("More Apps")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func openAppStore(appID: String) {
        if let url = URL(string: "https://apps.apple.com/app/id\(appID)") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - App Info Model
struct AppInfo: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let appStoreID: String
    let iconName: String
}

#Preview {
    NavigationStack {
        MoreAppsView()
    }
}
