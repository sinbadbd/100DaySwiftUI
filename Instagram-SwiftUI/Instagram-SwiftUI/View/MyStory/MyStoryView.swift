//
//  MyStoryView.swift
//  Instagram-SwiftUI
//
//  Created by Imran on 4/7/21.
//

import SwiftUI

struct MyStoryView: View {
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(Color.blue, lineWidth: 2) 
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                Spacer()
                
                
            }.frame(width: 40, height: 40)
            
            Text("User story-1")
                .font(.system(size: 8))
                .foregroundColor(.gray)
        }
    }
}

struct MyStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyStoryView()
    }
}

