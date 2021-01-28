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
                Button(action: {}) {
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
            
            VStack{
                Image(selectedItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(selectedItem.image)", in: animation)
                    .padding()
            }
            
            Spacer()
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
