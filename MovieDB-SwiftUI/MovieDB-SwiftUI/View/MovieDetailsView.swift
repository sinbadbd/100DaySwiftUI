//
//  MovieDetailsView.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    var body : some View{
 
        VStack(alignment: .leading){
            ScrollView{
                 TopBannerView()
//                    Spacer()
                /*
                HStack{
                    
                    ZStack{
                        // GeometryReader{ geo in
                        Image("hero")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .background(Color.red)
                        // .frame(width: geo.size.width, height: geo.size.height)
                        //     }
                        
                    }
                        //.frame(width:UIScreen.main.bounds.width/3, height: 220)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.green, lineWidth: 1)
                    )
                        .background(Color.red)
                    //                    .padding(.top, -20)
                    //                    .padding(.leading, 20)
                    
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            
                            VStack{
                                CircularViewProgress()
                                
                            }
                            //                             .padding(.top, -80)
                            //                                 .padding(.leading, 10)
                            Button(action: {
                                
                            }) {
                                
                                ZStack{
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                        .padding()
                                }
                                
                            }
                            Button(action: {
                                
                            }) {
                                
                                ZStack{
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                        .padding()
                                }
                                
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                ZStack{
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 50, height: 50)
                                    
                                    Image(systemName: "suit.heart")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                        .padding()
                                    
                                    //  .frame(width: 16, height: 16)
                                    
                                }
                                
                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text("312123 people Watch")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("230 min")
                                .font(.subheadline)
                            Text("Scott has been a case of arrested development ever since his firefighter father died when he was seven. He’s now reached his mid-20s having achieved little, chasing a dream of becoming a tattoo artist that seems far out of reach. As his ambitious younger sister heads off to college, Scott is still living with his exhausted ER nurse mother and spends his days smoking weed, hanging with the guys — Oscar, Igor and Richie — and secretly hooking up with his childhood friend Kelsey. But when his mother starts dating a loudmouth firefighter named Ray, it sets off a chain of events that will force Scott to grapple with his grief and take his first tentative steps toward moving forward in life.")
                                .lineLimit(3)
                            
                        }
                        // .padding(.top,10)
                        //.position(CGPoint(x: 0, y: 0))
                    }
                    
                    //                .padding(.leading, 5)
                    //                .padding(.trailing, 5)
                    //   .padding(.top, -80)
                    
                    //  Spacer()
                }
                */
                //    Spacer()
                
                // GeometryReader { geo in
               
                /*
                Button(action: {
                    
                }) {
                    Text("test")
                        
                        .foregroundColor(.white)
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: 40 )
                .background(Color.blue)
         
                
                ForEach(0..<10){i in
                    
                    Text("haha \(i)")
                }  //  .frame(width: UIScreen.main.bounds.width)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.purple, lineWidth: 1)
                )
                */
                
                
            }
//            .padding()
            
//  Spacer()
        }
//        .padding()
       .ignoresSafeArea(.all)
//        .edgesIgnoringSafeArea(.bottom)
            //  .frame(width: UIScreen.main.bounds.width-100)
            //        .padding(.trailing, 20)
            //   .padding(.leading, 20)
            //   .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            //          .padding(.trailing, 40)
            //        .padding(.horizontal, 10)
            //  .padding(.trailing, -40)
            .background(Color.yellow)
            .foregroundColor(.white)
        //   .opacity(0.5)
        //   .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView()
    }
}
