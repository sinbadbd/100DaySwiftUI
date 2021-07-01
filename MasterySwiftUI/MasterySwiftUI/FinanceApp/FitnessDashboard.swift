//
//  FitnessDashboard.swift
//  MasterySwiftUI
//
//  Created by Imran on 23/5/21.
//

import SwiftUI

struct FitnessDashboard: View {
    var body: some View {
        VStack{
            
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    
                    StartPageView()
//                    Spacer()
                    Text("Easy way to \n manage Your \n Money")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        
                    }, label: {
                        VStack{
                            
                            Text("Get Start")
                        }
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .frame(
                            width: UIScreen.main.bounds.width - 40,
                            height: 50
                        )
                        .background(Color.white)
                        
                    }
                    )
                    
                }
                .padding()
            }
        }
    }
}

struct FitnessDashboard_Previews: PreviewProvider {
    static var previews: some View {
        FitnessDashboard()
    }
}
