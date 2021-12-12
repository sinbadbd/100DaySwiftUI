//
//  OnBoardingPage.swift
//  ECommerceUI
//
//  Created by Imran Mia on 11/12/21.
//

import SwiftUI

struct OnBoardingPage: View {
    
    @State var showLoginPage: Bool = false
    
    var body: some View {
        VStack(alignment: .center){
            Text("Find your\n Gadget")
                .font(.custom(AppFonts.shared.RobotoBold, size: 44))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image("onboard")
                .resizable()
                .aspectRatio(.none, contentMode: .fit)
                //.position(x: UIScreen.main.bounds.width/2)
                .frame(width:250,alignment: .center)
                .padding(.top, 150)
            
            Button {
                withAnimation {
                    showLoginPage = true
                }
            } label: {
                Text("Get Start")
                    .font(.custom(AppFonts.shared.RobotoRegular, size: 20))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal, 30)
            .offset(y: getRect().height < 750 ? 20 : 40)
            Spacer()
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color("Purple")
        )
        .overlay(
            Group {
                if showLoginPage {
                    LoginPageView()
                        .transition(.move(edge: .bottom ))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
