//
//  NavigationEnum.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//

// MARK: Navigation Routes

enum NavigationRoute: Hashable {
    
    case signIn
    case signUp
    case home
    case search
    case detail(selectedMedicine: ConceptProperty)
}

extension NavigationRoute: Identifiable {
    var id: String {
        switch self {
            case .signIn: return "signIn"
            case .signUp: return "signup"
            case .home: return "home"
            case .search: return "search"
            case .detail: return "detail"
        }
    }
}

// MARK: Endpoint

enum Endpoint: String {
    case getDrugs
    
    var path: String {
        switch self {
            case .getDrugs:
                return "REST/drugs.json"
        }
    }
}

// MARK: Param Type

enum ParamType {
    case query
    case body
}

