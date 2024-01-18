//
//  GustoApp.swift
//  Gusto
//
//  Created by supasai haplakhon on 18/1/24.
//

import SwiftUI

@main
struct GustoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Restaurant.self)
    }
}
