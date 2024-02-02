//
//  SwiftUI_SwiftDataApp.swift
//  SwiftUI+SwiftData
//
//  Created by Moataz Akram on 31/01/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Bug.self)
    }
}
