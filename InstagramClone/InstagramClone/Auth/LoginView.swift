//
//  LoginView.swift
//  InstagramClone
//
//  Created by Imran Mia on 19/11/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack{
            //Image(systemName: "")
            Text("Instagram")
                .font(.largeTitle)
                
            Button(action: {
                
            }, label: {
                Spacer(minLength: 20)
                HStack {
                    Text("Create New Account")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .font(.caption)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity,minHeight: 40)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(4)
                Spacer(minLength: 20)
            })
            
            Button(action: {
                
            }, label: {
                Spacer(minLength: 20)
                HStack {
                    Text("Login")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .font(.caption)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity,minHeight: 40)
                .foregroundColor(.blue)
                //.background(Color.blue)
                .cornerRadius(4)
                Spacer(minLength: 20)
            })
            
            
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
