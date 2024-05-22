//
//  Tab.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case cards = "Cards"
    case learn = "Learn"
    case resources = "Resources"
    case settings = "Settings"
    
    var image: String {
        switch self {
            
        case .cards:
            "lanyardcard"
        case .learn:
            "list.bullet.rectangle.portrait"
        case .resources:
            "archivebox"
        case .settings:
            "gear"
        }
    }
    
    var index: Int { Tab.allCases.firstIndex(of: self) ?? 0 }
}
