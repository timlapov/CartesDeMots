//
//  CartesDeMotsApp.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

//import SwiftUI
//import SwiftData
//
//@main
//struct CartesDeMotsApp: App {
//    var body: some Scene {
//        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
//        
//        WindowGroup {
//            ContentView()
//                //.preferredColorScheme(.light)
//                .modelContainer(for: [Card.self, Resource.self, Settings.self], inMemory: false, isAutosaveEnabled: true, isUndoEnabled: true) { result in
//                    switch result {
//                    case .success(let success):
//                        print("ModelContainer created successfully")
//                        do {
//                            try success.mainContext.save()
//                        } catch {
//                            print("Error saving context: \(error)")
//                        }
//                    case .failure(let failure):
//                        print("Error when creating ModelContainer \(failure.localizedDescription)")
//                    }
//                }
//        }
//    }
//}
import SwiftUI
import SwiftData
import CloudKit

@main
struct CartesDeMotsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Card.self, Category.self, Resource.self, Settings.self]) { result in
                    switch result {
                    case .success(let container):
                        // Включаем автоматическое сохранение
                        container.mainContext.autosaveEnabled = true
                        print("✅ ModelContainer successfully created")

                        // Проверяем статус CloudKit
                        checkCloudKitStatus()

                    case .failure(let error):
                        print("🛑 Error creating ModelContainer: \(error.localizedDescription)")
                    }
                }
        }
    }
    
    private func checkCloudKitStatus() {
        CKContainer.default().accountStatus { status, error in
            switch status {
            case .available:
                print("iCloud is available")
            case .noAccount:
                print("⚠️ The user is not authorized in iCloud")
            case .couldNotDetermine:
                print("⚠️ Failed to determine iCloud status")
            case .restricted:
                print("⚠️ Access to iCloud is limited")
            case .temporarilyUnavailable:
                print("⚠️ Access to iCloud is temporarily restricted")
            @unknown default:
                print("⚠️ Unknown iCloud status")
            }

            if let error = error {
                print("🛑 ERROR CloudKit: \(error.localizedDescription)")
            }
        }
    }
}

/// Ключи `@AppStorage` (UserDefaults), общие для нескольких экранов.
/// Хранится на устройстве (не в iCloud), чтобы выбор не «перетекал» между устройствами.
enum AppStorageKeys {
    /// Выбранная категория: UUID в виде строки, пустая строка = «Все слова».
    /// Общий для главного экрана (CardsView) и тренировки (LearnView) — держит их выбор синхронным.
    static let selectedCategoryID = "selectedCategoryID"
}
