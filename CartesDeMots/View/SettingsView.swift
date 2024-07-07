//
//  SettingsView.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/04/2024.
//
//
import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var settings: [Settings]
    
    @State private var language: String = "🏳️"
    @State private var startupTab: Tab = .words
    @State private var showInfoAlert = false
    
    @FocusState private var isLanguageFieldFocused: Bool
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                    Text("Settings")
                            .font(.title)
                            .fontDesign(.rounded)
                            .bold()
                            .padding(.top, -16)
                
                // Language selection
                VStack(alignment: .leading) {
                    Text("Language")
                        .font(.headline)
                    TextField("Enter language (emoji or name)", text: $language)
                        .focused($isLanguageFieldFocused)
                        .onChange(of: language) { _, newValue in
                            if newValue.count > 20 {
                                language = String(newValue.prefix(20))
                            }
                        }
                        .padding()
                        .background{
                            Color.white.opacity(0.4)
                            GlassView()
                        }
                        .cornerRadius(10)
                        //.shadow(radius: 5)
                        .onChange(of: language) { _, newValue in
                            if newValue.count > 20 {
                                language = String(newValue.prefix(20))
                            }
                        }
                }
                .padding(.horizontal)
                
                // Selecting the start page
                VStack(alignment: .leading) {
                    Text("Startup Page")
                        .font(.headline)
                    Picker("", selection: $startupTab) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Text(tab.localizedName).tag(tab)
                        }
                    }
                    .pickerStyle(.wheel)
                    .background{
                        Color.white.opacity(0.1)
                        GlassView()}
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Information button
                Button("How to use the app") {
                    showInfoAlert = true
                }
                .padding()
                .background{
                    Color.orange.opacity(0.1)
                    GlassView()
                }
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                .foregroundColor(.orange)
                
                Spacer()
                
                Button("Write to developer") {
                    writeToDeveloper()
                }
                .padding()
                .background{
                    Color.orange.opacity(0.05)
                    GlassView()
                }
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                .foregroundColor(.orange)
                
                Spacer()
            }
            .padding()
            .background{
                Image("bgSettings")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            isLanguageFieldFocused = false
        }
        .onAppear(perform: loadSettings)
        .onChange(of: language) { saveSettings() }
        .onChange(of: startupTab) { saveSettings() }
        .alert(isPresented: $showInfoAlert) {
            Alert(
                title: Text("How to use the app"),
                message: Text("how_to_alert_text"),
                dismissButton: .default(Text("Got it"))
            )
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
