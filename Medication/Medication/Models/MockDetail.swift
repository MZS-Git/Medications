//
//  MockDetail.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import Foundation

struct MockDetail: Decodable, Identifiable {
    let id: String
    let title: String
    let items: [String]
}

