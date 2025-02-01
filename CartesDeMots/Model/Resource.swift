//
//  Resource.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 30/06/2024.
//

import Foundation
import SwiftData

@Model
final class Resource: Identifiable {
    var id: UUID?
    var title: String?
    var link: String?
    var addDate: Date?
    
    init(title: String, link: String) {
        self.id = UUID()
        self.title = title
        self.link = link
        self.addDate = Date.now
    }
}
