//
//  MedicationApp.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI

@main
struct MedicationApp: App {
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainNavigationView()
            } else {
                SplashView()
            }
        }
    }
}
