//
//  HapticManager.swift
//  Crypto
//
//  Created by Imran on 2/5/22.
//

import Foundation
import SwiftUI

class HapticManager{
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
    }
}
