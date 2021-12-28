//
//  LoginPageView.swift
//  ECommerceUI
//
//  Created by Imran Mia on 11/12/21.
//

import SwiftUI

struct LoginPageView: View {
    
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    
    var body: some View {
        VStack{
            
            Text("Welcome\n back")
                .font(.custom(AppFonts.shared.RobotoRegular, size: 40))
                .foregroundColor(.white)
                .frame( maxWidth: .infinity,alignment: .leading)
                .frame( height: getRect().height / 3.5)
                .padding()
                .background(
                    ZStack{
                        LinearGradient(colors: [
                        Color("LoginCircle"),
                        Color("LoginCircle")
                            .opacity(0.8),
                        Color("purple")
                        ], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)

                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(30)
                        
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false){
                
            }
            .frame( maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                // custom corner
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
            )
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("purple")
        )
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
