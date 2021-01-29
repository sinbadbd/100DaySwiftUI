//
//  SignupView.swift
//  Tinder-SwiftUI
//
//  Created by Imran on 12/1/21.
//

import SwiftUI

struct SignupMainView: View {
    
    @State private var isActive = false
    
    var body: some View {
        
        VStack {
            Text("Find your soul mate")
                .font(.title)
                .foregroundColor(Utils.color)
                .padding(.top, 40)
            //                    .padding()
            
            Text("Match and chat with people you like from your area.")
                .font(.system(size: 16))
                //                .foregroundColor(.white)
                .padding(.top, 10)
                .padding(.leading,40)
                .padding(.trailing,40)
                .multilineTextAlignment(.center)
            
            
            
            Group{
                
                
                NavigationLink(destination:  SignInView(), isActive: $isActive) {
                    
                    
                    Button(action: {
                        isActive = true
                    }, label: {
                        Text("Login")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .frame(width:260, height:44)
                            .background(Utils.color)
                            .cornerRadius(20)
                        
                    })
                    .padding(.top, 80.0)
                    
                }
                
                NavigationLink(destination:  SignUpView(), isActive: $isActive){
                    
                    Button(action: {
                        isActive = true
                    }, label: {
                        Text("Signup")
                            .font(.system(size: 18))
                            .foregroundColor(Utils.color)
                            .frame(width:260, height:44)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        
                    })
                    .padding()
                }
                
            }
            
        }
    }
}

struct SignupMainView_Previews: PreviewProvider {
    static var previews: some View {
        SignupMainView()
    }
}
