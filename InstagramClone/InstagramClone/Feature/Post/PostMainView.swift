//
//  PostView.swift
//  InstagramClone
//
//  Created by Imran Mia on 9/12/21.
//

import SwiftUI

struct PostMainView: View {
    var body: some View {
        VStack{
            PostTopView()
                //.background(Color.green)
            PostImageView()
                //.background(Color.blue)
            
            PostButtonView()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostMainView()
    }
}
