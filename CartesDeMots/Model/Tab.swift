//
//  Tab.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case list = "List"
    case cards = "Cards"
    case resources = "Resources"
    
    var image: String {
        switch self {
            
        case .list:
            "list.bullet.rectangle.portrait"
        case .cards:
            "lanyardcard"
        case .resources:
            "archivebox"
        }
    }
    
    var index: Int { Tab.allCases.firstIndex(of: self) ?? 0 }
}
