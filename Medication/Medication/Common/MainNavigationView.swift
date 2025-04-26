//
//  MainNavigationView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//

import SwiftUI

/// The main navigation view of the application, responsible for managing navigation
/// between different screens using a `NavigationCoordinator`.
/// It handles both standard navigation destinations and sheets, ensuring a seamless
/// flow between views based on different routes.
///
/// - Uses:
///   - `NavigationCoordinator` to manage navigation state and paths.
///   - Conditional navigation using `NavigationStack` and `sheet` for presenting views.
struct MainNavigationView: View {
    
    @StateObject private var coordinator = NavigationCoordinator()
    
    /// The body of the view that sets up the main navigation stack.
    /// It provides navigation paths to various views based on `NavigationRoute`
    /// and presents different sheets when triggered by the `coordinator`.
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            MedicationsListView().environmentObject(coordinator)
                .navigationDestination(for: NavigationRoute.self) { route in
                    // Navigate based on the route
                    switch route {
                        case .home:
                            MedicationsListView().environmentObject(coordinator)
                        case .search:
                            SearchMedicationView().environmentObject(coordinator)
                        case .signIn:
                            EmptyView()
                        case .signUp:
                            EmptyView()
                        case .detail(let medication):
                            MedicationDetailView(medicationItem: medication).environmentObject(coordinator)
                    }
                }
                .sheet(item: $coordinator.presentedSheet) { sheetRoute in
                    // Display a sheet based on the route
                    switch sheetRoute {
                        case .home:
                            MedicationsListView().environmentObject(coordinator)
                        case .search:
                            NavigationStack {
                                SearchMedicationView().environmentObject(coordinator)
                            }
                        case .signIn:
                            EmptyView()
                        case .signUp:
                            EmptyView()
                        case .detail(let medication):
                            MedicationDetailView(medicationItem: medication).environmentObject(coordinator)
                    }
                }
        }
    }
}

#Preview {
    MainNavigationView()
}
