//
//  ImageView.swift
//  InstagramClone
//
//  Created by Imran Mia on 9/12/21.
//

import SwiftUI

struct PostImageView: View {
    var body: some View {
        VStack{
            Image("spiderman")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame( height: 300)
                //.frame(width: 14, height: 14, alignment: .trailing)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        PostImageView()
    }
}
