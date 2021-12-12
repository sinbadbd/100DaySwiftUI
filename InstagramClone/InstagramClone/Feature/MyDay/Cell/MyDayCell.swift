//
//  MyDayCell.swift
//  InstagramClone
//
//  Created by Imran Mia on 4/12/21.
//

import SwiftUI

struct MyDayCell: View {
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
                            startPoint:
                                    .topTrailing,
                            endPoint:
                                    .bottomLeading),
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .frame(width: 60, height: 60)
                             
                Image(systemName: "house")
                    .resizable()
                    .clipShape(Circle())
                    .padding([.all], 5)
                    .foregroundColor(.red)
                    .frame(width: 50, height: 50)
            }
             
            Text("name")
        }
    }
    
}

struct MyDayCell_Previews: PreviewProvider {
    static var previews: some View {
        MyDayCell()
    }
}
