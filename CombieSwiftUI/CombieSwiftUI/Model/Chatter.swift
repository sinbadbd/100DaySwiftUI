//
//  Chatter.swift
//  CombieSwiftUI
//
//  Created by Imran on 23/5/22.
//

import Foundation
import Combine

public struct Chatter{
    public let name: String
    public let message: CurrentValueSubject<String,Never>
    
    init(name: String, message: String){
        self.name = name
        self.message = CurrentValueSubject(message)
    }
}
