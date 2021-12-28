//
//  ContentView.swift
//  ChatApp
//
//  Created by Imran Mia on 28/12/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = false
    
    @State var email = ""
    @State var password = ""
    
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
                    
                    Text("Here is my create account page")
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
        }else {
            print("Register into firebase")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
