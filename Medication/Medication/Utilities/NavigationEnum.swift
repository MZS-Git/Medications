//
//  NavigationEnum.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 23/04/2025.
//


enum NavigationRoute: Hashable {
    case signIn
    case signUp
    case home
    case search
    case detail
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

