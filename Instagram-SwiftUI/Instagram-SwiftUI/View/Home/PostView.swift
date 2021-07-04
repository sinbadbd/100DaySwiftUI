//
//  PostView.swift
//  Instagram-SwiftUI
//
//  Created by Imran on 4/7/21.
//

import SwiftUI

struct PostView: View {
    @State private var isPressedLike = false
    @State var isNavLinkActive = false
    
    @State var presentingModal = false

    
    var body: some View {
        VStack(alignment:.leading){
            
            //MARK:-
            HStack{
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 40))
                Text("User Name")
                    .font(.system(size: 14))
                Spacer()
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
            }.padding([.leading, .trailing],10)
            
            //MARK:-
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<4) {_ in
                        
                        Image("codm")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            
            //MARK:- Buttons
            HStack{
                HStack{
                    Button(action: {
                        self.isPressedLike.toggle()
                    }, label: {
                        Image(systemName: isPressedLike ? "suit.heart.fill" : "suit.heart")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    })
                    NavigationLink(destination: Comments(),isActive: $isNavLinkActive) {
                        Button(action: {
                            self.isNavLinkActive = true

                        }, label: {
                            Image(systemName: "message")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        })
                    }
                    
                    Button(action: {
                        self.presentingModal = true
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    })
                    .sheet(isPresented: $presentingModal) { ShareCommentSheetView(presentedAsModal: self.$presentingModal) }

                }
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                })
            }
            .padding([.leading,.trailing], 10)
            
            //MARK:-
            VStack{
                Text("2,342342 Likes")
                    .font(.system(size: 14))
            }.padding([.leading], 10)
            .padding([.top], 5)
            
            //MARK:-
            VStack{
                Text("We’ve done the hard work so you don’t have to. Build your own Instagram-like social network app for iOS,")
                    .font(.system(size: 12))
            }.padding([.leading], 10)
            .padding([.top], 2)
            
            //MARK:-
            VStack(alignment:.leading) {
                
                NavigationLink(destination: Comments(),isActive: $isNavLinkActive){
                Button(action: {
                    self.isNavLinkActive = true
                }, label: {
                    Text("View all 20 comments")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12))
                    
                })
                }
                Text("2 days ago")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 11))
                    .multilineTextAlignment(.leading)
            }
            .padding(.top, 2)
            .padding([.leading], 10)
            
            
        }
    }
}



struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
