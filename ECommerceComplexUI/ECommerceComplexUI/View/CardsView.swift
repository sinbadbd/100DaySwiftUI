//
//  CardsView.swift
//  ECommerceComplexUI
//
//  Created by Imran on 28/1/21.
//

import SwiftUI

struct CardsView: View {
    
    var item : Item
    var animation : Namespace.ID
    
    var body: some View {
        VStack{
            
            HStack{
                Spacer(minLength: 0)
                Text(item.price)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                
                
            }.padding()
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(item.image)", in: animation)
                .padding()
            
            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .matchedGeometryEffect(id: "title\(item.id)", in: animation)
            
            Text(item.subTitle)
                .font(.caption)
                .foregroundColor(.gray)
                .matchedGeometryEffect(id: "subTitle\(item.id)", in: animation)
            
            HStack{
                Button(action:{}) {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .matchedGeometryEffect(id: "heart\(item.image)", in: animation)

                Spacer(minLength: 0)
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "image\(item.rating)", in: animation)
           
            }.padding()
            
        }
        .padding(.bottom)
        .background(Color(item.image))
        .cornerRadius(15)
    }
}

//struct CardsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardsView()
//    }
//}
