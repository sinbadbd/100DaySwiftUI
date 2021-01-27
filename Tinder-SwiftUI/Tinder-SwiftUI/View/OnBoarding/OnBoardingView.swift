//
//  OnBoardingView.swift
//  Tinder-SwiftUI
//
//  Created by Imran on 12/1/21.
//

import SwiftUI

struct OnBoardingView: View {
    @State var currentPageIndex = 0
    
    var body: some View {
        ZStack{
            Utils.color
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack{
                    
                    // 01748407730
                    VStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("Private Messages")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                        //                    .padding()
                        
                        Text("Swipe right to get a match with people you like from your area.")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.leading,40)
                            .padding(.trailing,40)
                            .multilineTextAlignment(.center)
                    }
                    .frame(
                        width:UIScreen.screenWidth,
                        height:UIScreen.screenHeight-300
                    )
                    .background(Color.green)
                    
                    VStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("Private Messages")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                        // .padding()
                        
                        Text("Swipe right to get a match with people you like from your area.")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(.top, 10)
                            .padding(.leading,40)
                            .padding(.trailing,40)
                            .multilineTextAlignment(.center)
                    }
                    .frame(
                        width:UIScreen.screenWidth,
                        height:UIScreen.screenHeight-300
                    )
                    .background(Color.yellow)
                }
           
            })
            //            .frame( maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}


struct PageControl : UIViewRepresentable {

  var current = 0

  func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
    let page = UIPageControl()
    page.numberOfPages = 7
    page.currentPageIndicatorTintColor = .black
    page.pageIndicatorTintColor = .gray
    return page
  }

  func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
    uiView.currentPage = current
  }
}
