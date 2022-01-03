//
//  MainMessageViewModel.swift
//  ChatApp
//
//  Created by Imran Mia on 3/1/22.
//

import Foundation

class MainMessageViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser : ChatUser?
    @Published var isUserShowLogOutUser = false
    
    init(){
        DispatchQueue.main.async {
            self.isUserShowLogOutUser = FirebaseManager.shared.auth.currentUser?.uid == nil
            print("self.isUserShowLogOutUser: \(self.isUserShowLogOutUser)")
        }
        
        fetchCurrentUser()
    }
    
    func fetchCurrentUser(){
     guard let uid =  FirebaseManager.shared.auth.currentUser?.uid  else {
         self.errorMessage = "Could not find firebase uid"
         return
     }
        //self.errorMessage = "\(uid)"
        FirebaseManager.shared.fireStore.collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = snapshot?.data() else { return }
                print(data)
                let uid = data["uid"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let profileImageURL = data["profileImage"] as? String ?? ""
                let chatUser = ChatUser(uid: uid, email: email, profileImageURL: profileImageURL)
                self.chatUser = chatUser
            }
    }
    
    func handleSignout(){
        isUserShowLogOutUser.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
}
