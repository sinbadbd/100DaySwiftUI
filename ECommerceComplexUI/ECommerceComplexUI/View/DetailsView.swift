//
//  DetailsView.swift
//  ECommerceComplexUI
//
//  Created by Imran on 28/1/21.
//

import SwiftUI

struct DetailsView: View {
    @Binding var selectedItem: Item
    @Binding var show : Bool
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack{
            HStack(spacing: 25){
                Button(action: {
                    // closing view...
                    withAnimation(.spring()){
                        show.toggle()
                        
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "magnifiyingglass")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
                Button(action: {}) {
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
            }.padding()
            
            VStack(spacing:10){
                Image(selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(selectedItem.image)", in: animation)
                    .padding()
                
                Text(selectedItem.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Text(selectedItem.subTitle)
                     .foregroundColor(.gray)
                    .padding(.top,2)
                
                HStack{
                    Button(action:{}) {
                        Image(systemName: "suit.heart")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .matchedGeometryEffect(id: "heart\(selectedItem.image)", in: animation)

                    Spacer(minLength: 0)
                    Text(selectedItem.rating)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "rating\(selectedItem.rating)", in: animation)
               
                }.padding()
            }
            .padding(.top,35)
            .background(
                    Color(selectedItem.image)
            
                .clipShape(CustomShap())
                .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
            )
            .cornerRadius(15)
            .padding()
            
            Spacer()
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
