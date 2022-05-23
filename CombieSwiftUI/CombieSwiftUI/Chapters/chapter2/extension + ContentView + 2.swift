//
//  extension + ContentView + 2.swift
//  CombieSwiftUI
//
//  Created by Imran on 23/5/22.
//

import Foundation
import Combine

extension ContentView{
    public func exampleJust(){
        SupportCode.example(of: "Just") {
            
            let just = Just("Hello world")
            
            _ = just.sink(receiveCompletion: { value in
                print("Receive completion",value)
            }, receiveValue: { data in
                print("receive value", data)
            })
        }
    }
}

extension ContentView {
    public func exampleSubscribe(){
        SupportCode.example(of: "Subscribe") {
            let notification = Notification.Name("my notification")
            
            let publisher = NotificationCenter.default.publisher(for: notification)
            
            let center = NotificationCenter.default
            
            let subscribe = publisher.sink { _ in
                print("Notification receive from a publisher")
            }
        }
    }
}
