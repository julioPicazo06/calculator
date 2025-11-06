//
//  CalculadoraApp.swift
//  Calculadora
//
//  Created by julio picazo on 06/11/25.
//

import SwiftUI
import CoreData

@main
struct CalculadoraApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
