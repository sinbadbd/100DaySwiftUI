//
//  DiscoverCell.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 26/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverCell: View {
    
    let result : MovieResultViewModel
    
    var body: some View {
        VStack{
            
            WebImage(url: URL(string: result.posterPath))
                .resizable()
                .scaledToFill()
                .frame( height: 280)
                //                        .aspectRatio(16/9, contentMode: .fill)
                .cornerRadius(8)
                .shadow(radius: 4)
            Text(result.title)
                .lineLimit(1)
                 .minimumScaleFactor(0.5)
                .padding([.top,.bottom],10)
            
        }
        .frame( height: 300)
        
        
    }
}

struct DiscoverCell_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
