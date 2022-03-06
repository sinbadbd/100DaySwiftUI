//
//  Home.swift
//  WaterDropWave
//
//  Created by Imran Mia on 12/2/22.
//

import SwiftUI

struct Home: View {
    
    @State var progress: CGFloat = 0.5
    @State var startAnimation: CGFloat = 0
    
    var body: some View {
        VStack{
            Image("spiderman")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(10)
                .background(.white, in: Circle())
            
            Text("Spiderman")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 30)
            
            // make wave form
            GeometryReader { proxy in
                let size = proxy.size
                
                ZStack {
                    Image(systemName: "drop.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio( contentMode: .fit)
                        .foregroundColor(.white)
                        .scaleEffect(x: 1.1,y: 1)
                        .offset(y: -1)
                    
                    //wave
                    WaterWave(progress: 0.5, waveHeight: 0.1, offset: startAnimation)
                        .fill(Color.blue)
                        .overlay(content: {
                            ZStack {
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 15, height: 15)
                                    .offset(x: -20)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 10, height: 10)
                                    .offset(x: -25)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 5, height: 5)
                                    .offset(x: 20,y: 5)
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 10, height: 10)
                                    .offset(x: 0,y: 10)
                            }
                        })
                        .mask{
                            Image(systemName: "drop.fill")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .padding(20)
                        }
                    
                }
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear {
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false )) {
                        startAnimation = size.width
                    }
                }
              
            }.frame(height: 350)
            
            
        }
        .padding()
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.gray)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct WaterWave: Shape{
    
    var progress: CGFloat
    var waveHeight: CGFloat
    
    
    var offset:CGFloat
    // initial animation start
    var animationData : CGFloat {
        get { offset}
        set { offset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: .zero)
            
            let progressHeight: CGFloat = (1 - progress) * rect.height
            print("progressHeight: \(progressHeight)")
            
            let height = waveHeight * rect.height
            print("height: \(height)")
            
            
            for value in stride(from: 0, to: rect.width, by: 2) {
                let x: CGFloat = value
                print("x-value: \(height)")
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                print("sine-value: \(height)")
                let y: CGFloat = progressHeight + (height * sine)
                print("y-value: \(height)")
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            //botom portion
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}
