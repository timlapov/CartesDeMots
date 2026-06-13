//
//  Category.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 12/06/2026.
//

import Foundation
import SwiftData

@Model
final class Category: Identifiable {
    var id: UUID?
    var name: String?
    var addDate: Date?

    @Relationship(deleteRule: .nullify, inverse: \Card.category)
    var cards: [Card]?

    init(name: String) {
        self.id = UUID()
        self.name = name
        self.addDate = Date.now
    }
}
