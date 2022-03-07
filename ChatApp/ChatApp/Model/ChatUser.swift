//
//  ChatUser.swift
//  ChatApp
//
//  Created by Imran Mia on 3/1/22.
//

import Foundation
struct ChatUser: Identifiable {
    var id : String { uid ?? "" }
    
    let uid, email, profileImageURL: String?

    init(dic: [String: Any]) {
        self.uid = dic["uid"] as? String ?? ""
        self.email = dic["email"] as? String ?? ""
        self.profileImageURL = dic["profileImage"] as? String ?? ""
    }
}
