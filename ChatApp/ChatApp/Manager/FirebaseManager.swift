//
//  FirebaseManager.swift
//  ChatApp
//
//  Created by Imran Mia on 2/1/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

class FirebaseManager: NSObject {
    
    static let shared = FirebaseManager()
    let auth: Auth
    let storage: Storage
    let fireStore: Firestore
    
    override init(){
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.fireStore = Firestore.firestore()
        super.init()
    }
}
