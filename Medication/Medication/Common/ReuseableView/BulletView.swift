//
//  BulletsView.swift
//  Medication
//
//  Created by Muhammad Zain Shahid on 26/04/2025.
//

import SwiftUI

struct BulletView: View {
    let title: String
    let items: [String]
    
    init(title: String, items: [String]) {
        self.title = title
        self.items = items
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.headline)
            
            ForEach(items, id: \.self) { item in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: Constants.Image.circleFill)
                        .font(.system(size: 6))
                        .padding(.top, 6)
                    Text(item)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

#Preview {
    BulletView(title: "", items: [])
}
