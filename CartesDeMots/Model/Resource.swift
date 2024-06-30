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
    let id: UUID?
    let title: String?
    let link: String?
    let addDate: Date?
    
    init(title: String, link: String) {
        self.id = UUID()
        self.title = title
        self.link = link
        self.addDate = Date.now
    }
}
