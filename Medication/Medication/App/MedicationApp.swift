//
//  MedicationApp.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct MedicationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
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
