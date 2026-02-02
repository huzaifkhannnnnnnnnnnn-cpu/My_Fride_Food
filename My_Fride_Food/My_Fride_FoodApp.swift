//
//  My_Fride_FoodApp.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 16/01/2026.
//

import SwiftUI

@main
struct My_Fride_FoodApp: App {
 @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
        }
    }
}
