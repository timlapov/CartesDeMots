//
//  Card.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 23/05/2024.
//

import Foundation
import SwiftData

@Model
final class Card: Identifiable {
    var id: UUID?
    var foreignWord: String?
    var translation: String?
    var comment: String?
    var addDate: Date?
    var rating: Int?
    var category: Category?

    init(foreignWord: String, translation: String, comment: String, category: Category? = nil) {
        self.id = UUID()
        self.foreignWord = foreignWord
        self.translation = translation
        self.comment = comment
        self.addDate = Date.now
        self.rating = 4
        self.category = category
    }
}
