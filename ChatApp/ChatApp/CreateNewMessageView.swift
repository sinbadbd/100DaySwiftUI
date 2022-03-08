//
//  NewMessageView.swift
//  ChatApp
//
//  Created by Imran Mia on 4/1/22.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

class CreateNewMessageViewModel: ObservableObject {
    
    @Published var user = [ChatUser]()
    @Published var errorMessage = ""
    
    init(){
        fetchAllUsers()
    }
    
    private func fetchAllUsers(){
        FirebaseManager.shared.fireStore.collection("users")
            .getDocuments { snapshot, error in
                if let error = error {
                    self.errorMessage = "Faild to fetch users \(error)"
                    return
                }
                snapshot?.documents.forEach({ list in
                    let data = list.data()
                    let user = ChatUser(dic: data)
 
                    if user.uid != FirebaseManager.shared.auth.currentUser?.uid {
                        self.user.append(.init(dic: data))
                    }
                })
            }
    }
}

struct CreateNewMessageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm = CreateNewMessageViewModel()
    
    let didSelecNewUser: (ChatUser) -> ()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.user) { users in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        didSelecNewUser(users)
                    } label: {
                        HStack(spacing: 8) {
                            WebImage(url: URL(string: "\(users.profileImageURL ?? "user")"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color(.label), lineWidth: 1)
                                )
                                .frame(width: 60, height: 60, alignment: .leading)
                            Text(users.email ?? "")
                            Spacer(minLength: 8)
                        }.padding(.horizontal)
                        Divider()
                            .padding(.vertical, 8)
                    }

                }
            }.navigationTitle("New Message")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
        }
    }
}

//struct CreateNewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
////        CreateNewMessageView(, didSelecNewUser: <#(ChatUser) -> ()#>)
//    }
//}
