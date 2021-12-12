//
//  PostTopView.swift
//  InstagramClone
//
//  Created by Imran Mia on 8/12/21.
//

import SwiftUI

struct PostTopView: View {
    var body: some View {
        HStack{
            Image("spiderman")
                .resizable()
                .cornerRadius(50)
                .frame(width: 40, height: 40, alignment: .leading)
            
            VStack(alignment: .leading){
                Text("Spider man: No way home")
                    .font(.caption)
                Text("Multi verse and madness")
                    .font(.caption2)
            }
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .resizable()
                    .frame(width: 14, height: 14, alignment: .trailing)
            })
             
        }.padding([.leading,.trailing],15)
    }
}

struct PostTopView_Previews: PreviewProvider {
    static var previews: some View {
        PostTopView()
    }
}
