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
    case settings = "Settings"
    
    var image: String {
        switch self {
            
        case .list:
            "list.bullet.rectangle.portrait"
        case .cards:
            "lanyardcard"
        case .resources:
            "archivebox"
        case .settings:
            "gear"
        }
    }
    
    var index: Int { Tab.allCases.firstIndex(of: self) ?? 0 }
}
