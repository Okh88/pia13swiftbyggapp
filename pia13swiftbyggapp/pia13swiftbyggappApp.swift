//
//  pia13swiftbyggappApp.swift
//  pia13swiftbyggapp
//
//  Created by Malmö Yrkehögskolan on 2025-01-13.
//

import SwiftUI
import SwiftData

@main
struct pia13swiftbyggappApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
