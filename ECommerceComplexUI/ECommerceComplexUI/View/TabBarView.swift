//
//  TabBarView.swift
//  ECommerceComplexUI
//
//  Created by Imran on 28/1/21.
//

import SwiftUI

struct TabBarView: View {
    var title :String
    
    @Binding var selected : String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action:{
            withAnimation(.spring()){
                selected = title
            }
        }) {
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(selected == title ? .white : .black)
                .padding(.horizontal, selected == title ? 20 : 0)
                .padding(.vertical, 10)
                .background(
                    ZStack{
                        if selected == title {
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}
