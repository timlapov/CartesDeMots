//
//  Settings.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 03/07/2024.
//
//
import Foundation
import SwiftData

@Model
final class Settings {
    var language: String?
    var mainTabRawValue: String?
    var theme: String?
    var mode: String?
    var notificationsEnabled: Bool?
    var notificationFrequency: String?
    var dailyGoal: Int?
    var stat: Double?
    
    var mainTab: Tab {
        get { Tab(rawValue: mainTabRawValue ?? "words") ?? .words }
        set { mainTabRawValue = newValue.rawValue }
    }
    
    init(language: String?, mainTab: Tab?, theme: String?, notificationsEnabled: Bool?, notificationFrequency: String?, dailyGoal: Int?, stat: Double?) {
        self.language = "🏳️"
        self.mainTabRawValue = "words"
        self.theme = "default"
        self.mode = "system"
        self.notificationsEnabled = false
        self.notificationFrequency = "daily"
        self.dailyGoal = 20
        self.stat = 100.00
    }
}
