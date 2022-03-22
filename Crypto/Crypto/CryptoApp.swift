//
//  CryptoApp.swift
//  Crypto
//
//  Created by Imran on 22/3/22.
//

import SwiftUI

@main
struct CryptoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
