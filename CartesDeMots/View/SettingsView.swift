//
//  SettingsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//
//
import SwiftUI
import SwiftData
import StoreKit

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.requestReview) var requestReview
    @Query private var settings: [Settings]

    @State private var language: String = "🏳️"
    @State private var startupTab: Tab = .words

    // App info
    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }

    private var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    }

    var body: some View {
        NavigationStack {
            Form {
                // MARK: - App Header
                Section {
                    appHeaderView()

                    NavigationLink {
                        MoreAppsView()
                    } label: {
                        Label("More Apps", systemImage: "square.grid.2x2")
                    }
                }

                // MARK: - About
                Section("About") {
                    NavigationLink {
                        HowToUseView()
                    } label: {
                        Label("How to Use", systemImage: "questionmark.circle")
                    }
                }

                // MARK: - Customization
                Section("Customization") {
                    HStack {
                        Label("Language", systemImage: "globe")
                        Spacer()
                        TextField("🏳️", text: $language)
                            .multilineTextAlignment(.trailing)
                            .frame(maxWidth: 100)
                            .onChange(of: language) { _, newValue in
                                if newValue.count > 20 {
                                    language = String(newValue.prefix(20))
                                }
                            }
                    }

                    Picker(selection: $startupTab) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Text(tab.localizedName).tag(tab)
                        }
                    } label: {
                        Label("Startup Page", systemImage: "house")
                    }
                }

                // MARK: - Feedback
                Section("Feedback") {
                    Button {
                        writeToDeveloper()
                    } label: {
                        Label(NSLocalizedString("Write to developer", comment: ""), systemImage: "envelope")
                            .foregroundStyle(.primary)
                    }

                    Button {
                        requestReview()
                    } label: {
                        Label("Review on the App Store", systemImage: "star")
                            .foregroundStyle(.primary)
                    }
                }

                // MARK: - General
                Section("General") {
                    Button {
                        openSystemSettings()
                    } label: {
                        Label("System Settings", systemImage: "gear")
                            .foregroundStyle(.primary)
                    }
                }
            }
//            .navigationTitle("Settings")
//            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: loadSettings)
        .onChange(of: language) { saveSettings() }
        .onChange(of: startupTab) { saveSettings() }

    }

    // MARK: - App Header View
    @ViewBuilder
    private func appHeaderView() -> some View {
        HStack(spacing: 16) {
            // App Icon
            if let iconImage = getAppIcon() {
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
                        Image(systemName: "square.2.layers.3d")
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Cartes de Mots")
                    .font(.headline)
                Text("\(appVersion) (\(buildNumber))")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }

    // MARK: - Helper Functions
    private func getAppIcon() -> UIImage? {
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
              let lastIcon = iconFiles.last else {
            return nil
        }
        return UIImage(named: lastIcon)
    }

    private func openSystemSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }

    private func loadSettings() {
        if let existingSettings = settings.first {
            language = existingSettings.language ?? "🏳️"
            startupTab = existingSettings.mainTab
        } else {
            let newSettings = Settings(language: "🏳️", mainTab: .words, theme: "default", notificationsEnabled: false, notificationFrequency: "daily", dailyGoal: 20, stat: 100.00)
            modelContext.insert(newSettings)
        }
    }

    private func saveSettings() {
        if let existingSettings = settings.first {
            existingSettings.language = language
            existingSettings.mainTab = startupTab
        } else {
            let newSettings = Settings(language: language, mainTab: startupTab, theme: "default", notificationsEnabled: false, notificationFrequency: "daily", dailyGoal: 20, stat: 100.00)
            modelContext.insert(newSettings)
        }

        do {
            try modelContext.save()
        } catch {
            print("Error saving settings: \(error)")
        }
    }

    private func writeToDeveloper() {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        let subject = String(format: NSLocalizedString("Feedback for CartesDeMots app (v%@)", comment: "Email subject"), appVersion)
        let body = String(format: NSLocalizedString("emailBody", comment: "Email body"))
        let recipient = "lapov.art@gmail.com"

        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        let urlString = "mailto:\(recipient)?subject=\(subjectEncoded)&body=\(bodyEncoded)"

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url) { success in
                if !success {
                    print("Failed to open mail app")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: [Settings.self])
}
