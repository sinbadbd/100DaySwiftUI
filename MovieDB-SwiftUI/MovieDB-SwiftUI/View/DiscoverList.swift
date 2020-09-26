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
                    }
                } .padding()
            }
        }
    }
}
