//
//  CartesDeMotsApp.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import SwiftUI
import SwiftData

@main
struct CartesDeMotsApp: App {
//    let container: ModelContainer
//        
//    init() {
//        do {
//            let schema = Schema([
//                Card.self
//            ])
//            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//            
//            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not configure ModelContainer: \(error)")
//        }
//    }
    var body: some Scene {
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
        
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .modelContainer(for: [Card.self, Resource.self], inMemory: false, isAutosaveEnabled: true, isUndoEnabled: true) { result in
                    switch result {
                    case .success(let success):
                        print("ModelContainer created successfully")
                        do {
                            try success.mainContext.save()
                        } catch {
                            print("Error saving context: \(error)")
                        }
                    case .failure(let failure):
                        print("Error when creating ModelContainer \(failure.localizedDescription)")
                    }
                }
        }
    }
}
