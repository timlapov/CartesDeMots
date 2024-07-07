//
//  HapticManager.swift
//  CartesDeMots
//
//  Created by Timothée LAPOV on 04/07/2024.
//

import Foundation
import SwiftUI

class HapticManager {
    static let shared = HapticManager() // Singleton
    
    private init() {} // Private initializer for singleton
    
    // Simple feedback
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impact = UIImpactFeedbackGenerator(style: style)
        impact.impactOccurred()
    }
    
    // Feedback notification
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let notification = UINotificationFeedbackGenerator()
        notification.notificationOccurred(type)
    }
    
    // Feedback selection
    func selection() {
        let selection = UISelectionFeedbackGenerator()
        selection.selectionChanged()
    }
    
    // Feedback sequence
    func sequence() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            generator.notificationOccurred(.success)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let impact = UIImpactFeedbackGenerator(style: .light)
            impact.impactOccurred()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let impact = UIImpactFeedbackGenerator(style: .medium)
            impact.impactOccurred()
        }
    }
}

// View extension
extension View {
    func hapticImpact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
        HapticManager.shared.impact(style: style)
    }
    
    func hapticNotification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        HapticManager.shared.notification(type: type)
    }
    
    func hapticSelection() {
        HapticManager.shared.selection()
    }
    
    func hapticSequence() {
        HapticManager.shared.sequence()
    }
}
