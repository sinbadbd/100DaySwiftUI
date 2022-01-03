//
//  ContentView.swift
//  ChatApp
//
//  Created by Imran Mia on 28/12/21.
//

import SwiftUI
 
struct LoginView: View {
    
    let didCompleteLoginCompletion: () -> ()
    
    @State var isLoginMode = false
    
    @State var email = ""
    @State var password = ""
    @State var loginStatusMessage = ""
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    Picker(selection: $isLoginMode,  label: Text("Picker here")){
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    
                    if !isLoginMode {
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                }else {
                                    
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                        .stroke(Color.black, lineWidth: 3)
                            )
                        }
                    }
                    
                    VStack{
                        Group{
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            SecureField("Password", text: $password)
                                
                        }
                        .padding(12)
                        .background(Color.white)
                    }.padding()
                       
                    
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Login" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                            Spacer()
                        }.background(Color.blue)
                    }.padding()
                    
                    Text(self.loginStatusMessage).foregroundColor(Color.red)
                }
            }
            .navigationTitle(isLoginMode ? "Login" : "Create Account")
            .background(Color.init( white: 0, opacity: 0.2)
                            .ignoresSafeArea())
            

        }.navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                ImagePicker(image: $image)
            }
        
    }
    
  
    
    
    private func handleAction(){
        if isLoginMode {
            print("login into firebase")
            loginAccount()
        }else {
            print("Register into firebase")
            createNewAccount()
        }
    }
    private func loginAccount(){
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.loginStatusMessage = "Failed \(error)"
                return
            }
            self.loginStatusMessage = "Successfully Login \(authResult?.user.uid)"
            self.didCompleteLoginCompletion()
        }
    }
    private func createNewAccount(){
         if self.image == nil {
            loginStatusMessage = "Please seclect image "
             return
        }
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.loginStatusMessage = "Failed \(error)"
                return
            }
            print("Successfully create user \(authResult?.user.uid)")
            self.loginStatusMessage = "Successfully create user \(authResult?.user.uid)"
            persistImageStore()
            self.didCompleteLoginCompletion()
        }
    }
    private func persistImageStore(){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.2) else { return }
        
        ref.putData(imageData, metadata: nil) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            ref.downloadURL { url, err in
                if let err = err {
                    return
                }
                print(url?.absoluteURL)
                guard let url = url else {return} 
                self.storeUserInformation(imageProfileUrl: url)
            }
            
        }
    }
    
    private func storeUserInformation(imageProfileUrl: URL){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["email": self.email, "uid" : uid, "profileImage": imageProfileUrl.absoluteString]
        
        FirebaseManager.shared.fireStore.collection("users").document(uid).setData(userData) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("success")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(didCompleteLoginCompletion: nil)
//    }
//}
