//
//  NavigationCoordinator.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//
import SwiftUI

/// A coordinator that manages navigation state and sheet presentations within a SwiftUI application.
class NavigationCoordinator: ObservableObject {
    
    /// A binding to the navigation path, enabling programmatic navigation.
    @Published var path = NavigationPath()
    
    /// An optional route currently presented as a sheet.
    @Published var presentedSheet: NavigationRoute?
    
    
    // MARK: - Navigation Stack Management
    
    /// Appends a new route to the navigation path, pushing a new view onto the navigation stack.
    ///
    /// - Parameter route: The route to navigate to.
    func push(_ route: NavigationRoute) {
        path.append(route)
    }
    
    
    /// Removes the last route from the navigation path, popping the top view from the navigation stack.
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    /// Clears the navigation path, effectively popping all views and returning to the root view.
    func popToRoot() {
        path = NavigationPath()
    }
    
    /// Sets the root of the navigation path to a specific route.
    ///
    /// - Parameter route: The route to set as the root.
    func setRoot(_ route: NavigationRoute) {
        path = NavigationPath()
        path.append(route)
    }
    
    // MARK: - Sheet Presentation Management
    
    /// Presents a sheet with the specified route.
    ///
    /// - Parameter route: The route to present in the sheet.
    func present(_ route: NavigationRoute) {
        presentedSheet = route
    }
    
    // MARK: - Sheet Presentation Management
    
    /// Presents a sheet with the specified route.
    ///
    /// - Parameter route: The route to present in the sheet.
    func dismissSheet() {
        presentedSheet = nil
    }
}
