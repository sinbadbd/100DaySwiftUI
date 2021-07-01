//
//  SwiftUILifeCycleApp.swift
//  SwiftUILifeCycle
//
//  Created by Imran on 27/5/21.
//

import SwiftUI

@main
struct SwiftUILifeCycleApp: App {
    
    
    //@UIApplicationDelegateAdaptor(MyAppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) var scenePhase
    
    init(){
        
    }
     
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("Active")
            case .inactive:
                print("InActive")
            case .background:
                print("Background")
            default :
                print("Nothing...| ")
            }
        }
    }
    
    
    func doSomething(){
     }
    func doSomme2(){
        
    }
}
