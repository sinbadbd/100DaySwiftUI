//
//  PostButtonView.swift
//  InstagramClone
//
//  Created by Imran Mia on 9/12/21.
//

import SwiftUI

struct PostButtonView: View { // MARK: Fix need View Builder
    var body: some View {
        HStack{
            Button(action: {
                
            }, label: {
                Image(systemName: "suit.heart")
                    .resizable()
                    .frame(width: 14, height: 14, alignment: .trailing)
            })
            Button(action: {
                
            }, label: {
                Image(systemName: "highlighter")
                    .resizable()
                    .frame(width: 14, height: 14, alignment: .trailing)
            })
            Button(action: {
                
            }, label: {
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 14, height: 14, alignment: .trailing)
            })
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 14, height: 14, alignment: .trailing)
            })
         //   ButtonViewBuilder(title: "bookmark")
          
        }.padding([.leading,.trailing],15)
    }
}

struct PostButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PostButtonView()
    }
}

struct ButtonViewBuilder: ViewModifier {

    var title: String

    func body(content: Content) -> some View {
        VStack {
            Button(action: {
                
            }, label: {
                Image(systemName: title)
                    .resizable()
                    .frame(width: 14, height: 14, alignment: .trailing)
            })
            content
        }
    }
}
//
//struct ButtonViewBuilder: View {
//    var icon:String?
//
//    init(icon:String?){
//        self.icon = icon
//    }
//    @ViewBuilder var buttonBuilder: some View {
////    func buttonBuilder() -> some View {
//        Button(action: {
//
//        }, label: {
//            Image(systemName: icon ?? "")
//                .resizable()
//                .frame(width: 14, height: 14, alignment: .trailing)
//        })
////        Text("This is another way to create a Group 👥")
////        Text("Just stack the views 🥞")
//    }
//}
