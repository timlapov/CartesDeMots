//
//  Tab.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/04/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case words = "tab_words"
    case learn = "tab_learn"
    case resources = "tab_resources"
    case settings = "tab_settings"
    
    var image: String {
        switch self {
            
        case .words:
            "square.2.layers.3d"
        case .learn:
            "square.3.layers.3d.down.right"
        case .resources:
            "link.icloud"
        case .settings:
            "gear"
        }
    }
    
    var index: Int { Tab.allCases.firstIndex(of: self) ?? 0 }
    var localizedName: String {
        NSLocalizedString(rawValue, comment: "Tab name")
    }
}
