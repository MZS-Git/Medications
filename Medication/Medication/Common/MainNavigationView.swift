//
//  MainNavigationView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 25/04/2025.
//

import SwiftUI

struct MainNavigationView: View {
    
    @StateObject private var coordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            MedicationsListView().environmentObject(coordinator)
                .navigationDestination(for: NavigationRoute.self) { route in
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
