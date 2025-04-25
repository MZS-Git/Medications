//
//  NavigationCoordinator.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//
import SwiftUI

class NavigationCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var presentedSheet: NavigationRoute?
    
    func push(_ route: NavigationRoute) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func setRoot(_ route: NavigationRoute) {
        path = NavigationPath()
        path.append(route)
    }
    
    func present(_ route: NavigationRoute) {
        presentedSheet = route
    }
    
    func dismissSheet() {
        presentedSheet = nil
    }
}
