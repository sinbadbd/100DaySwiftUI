//
//  LoginPageModel.swift
//  ECommerceUI
//
//  Created by Imran Mia on 11/12/21.
//

import Foundation

class LoginPageModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var reEnterPassowrd: String = ""
    @Published var showEnterPassword: Bool = false
    
    func loginAction(){
        
    }
    
    func registerAction(){
        
    }
    
    func forgotPasswordAction(){
        
    }
}
