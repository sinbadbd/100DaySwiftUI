//
//  DiscoverList.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 26/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct DiscoverList: View {
    let disListMovie : [MovieResultViewModel]
    
    var body: some View {
        
        LazyVStack{
            ScrollView(.horizontal,  showsIndicators: false) {
                
                LazyHStack{
                    
                              ForEach(self.disListMovie, id: \.title){dis in
                                  DiscoverCell(result: dis)
//                                    .frame(width: 300, height: 300)
//                                    .frame(width: 320, height: 240)

                                   
                              }
                } .padding()
           
            }
//
//            .background(Color.red)
         
            //                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
            
        }
        //.frame(width: 300, height: 200)
    }
}

//struct DiscoverList_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
