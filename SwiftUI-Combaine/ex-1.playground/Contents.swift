import UIKit
import Combine

//var str = "Hello, playground"

// (1) A Simple publisher using Just, to produce once for each subscriber
let _ = Just("Hello World")
    
    .sink { (value) in
        print("Value is \(value)")
}

// (2) Taking advantage of NotifcationCenter's publisher
let notification = Notification(name: .NSSystemClockDidChange, object: nil, userInfo: nil)
let notificationClockPublisher = NotificationCenter.default.publisher(for: .NSSystemClockDidChange)
    .sink(receiveValue: { (value) in
        print("Value \(value)")
    })
NotificationCenter.default.post(notification)
