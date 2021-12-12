//
//  ProfileUploadView.swift
//  InstagramClone
//
//  Created by Imran Mia on 7/12/21.
//

import SwiftUI

struct ProfileUploadView: View {
    var body: some View {
        VStack{
            ZStack{
  
                Image(systemName: "house")
                    .resizable()
                    .clipShape(Circle())
                    .padding([.all], 5)
                    .foregroundColor(.red)
                    .frame(width: 50, height: 50)
            }
            
            Text("Your story")
        }
        
    }
}

struct ProfileUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUploadView()
    }
}
