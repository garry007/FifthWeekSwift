//
//  FifthWeekSwiftApp.swift
//  FifthWeekSwift
//
//  Created by Gurpreet Singh on 2025-10-18.
//

import SwiftUI

@main
struct FifthWeekSwiftApp: App {
    let persistenceController = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            FeatureListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
