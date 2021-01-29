//
//  TopBannerView.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct TopBannerView : View {
//    var result : MovieResultViewModel
    var body: some View {
        
        VStack{
            ZStack{
                //                Spacer(minLength: 0)
                //                GeometryReader { geo in
                Image("hero")
                    .resizable()
                    .scaledToFill()
                    //                        .aspectRatio(contentMode: .fill)
                    .clipped()
                //                        .frame(width: geo.size.width, height: 350)
                
                
                VStack{
                    
//                    Button(action: {
//
//                    }){
//
//
//                        Image("play-button-1").resizable()
//                            .renderingMode(.template)
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.white)
//                            .frame(width: 40, height: 40)
//
//
//                    }
                    
                    
                    //                    Spacer(minLength: 0)
                    
                    VStack(alignment: .leading){
                        //  Spacer()
                        
                      //  GeometryReader { geometry in
                           Spacer()
                            VStack{
                                Text("The Avenger End Game")
                                    .font(.title)
    //                            Spacer()
                                HStack{
                                    
                                    ForEach(0..<5){buttonItem in
                                        
                                        Button(action: {
                                            
                                        }){
                                            Text("Action")
                                                .font(.headline)
                                                .padding(5)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 4)
                                                        .stroke(Color.purple, lineWidth: 1)
                                                )
                                        }
                                    }
                                }
                            }
                           // .frame(width:geometry.frame(in: .global).maxY)
                        // }
                        //“Text("maxY: \(Int(geometry.frame(in: .global).maxY))")”
                        
                         
                        .padding(.vertical)
                        
                    }.padding(.top, 60)
                    //                        Spacer(minLength: 0)
                    //                    .offset(x: 0, y: 100).font(.title)
                    .foregroundColor(.white)
                    //                     Spacer()
                }
                
                
                
                //                LinearGradient(gradient: Gradient(colors: [.clear,Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                //                    .frame(width: UIScreen.main.bounds.width, height: 350)
                
                
                
            }
        }
    }
}




struct TopBannerView_Previews: PreviewProvider {
    static var previews: some View {
        TopBannerView()
    }
}
