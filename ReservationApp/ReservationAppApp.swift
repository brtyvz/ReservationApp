//
//  ReservationAppApp.swift
//  ReservationApp
//
//  Created by Berat Yavuz on 28.11.2022.
//

import SwiftUI

@main
struct ReservationAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
