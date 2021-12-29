//
//  ContentView.swift
//  ChatApp
//
//  Created by Imran Mia on 28/12/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

class FirebaseManager: NSObject {
    
    let auth: Auth
    static let shared = FirebaseManager()
    override init(){
        FirebaseApp.configure()
        self.auth = Auth.auth()
        super.init()
    }
}
                                 
struct LoginView: View {
    
    init(){
        
    }
    
    @State var isLoginMode = false
    
    @State var email = ""
    @State var password = ""
    @State var loginStatusMessage = ""
    
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
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
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
        }
    }
    private func createNewAccount(){
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.loginStatusMessage = "Failed \(error)"
                return
            }
            print("Successfully create user \(authResult?.user.uid)")
            self.loginStatusMessage = "Successfully create user \(authResult?.user.uid)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
