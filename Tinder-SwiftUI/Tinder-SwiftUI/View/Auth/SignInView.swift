//
//  SignInView.swift
//  Tinder-SwiftUI
//
//  Created by Imran on 12/1/21.
//

import SwiftUI

struct SignInView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    var body: some View {
      
        VStack{
            TextField("Email", text: $email)
                .frame(width: UIScreen.screenWidth-40, height: 44)
                .border(Utils.color,width: 1)
                .cornerRadius(8)
                .padding(.leading, 20)
                
        }
        
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
