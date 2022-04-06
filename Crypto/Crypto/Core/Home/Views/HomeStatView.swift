//
//  HomeStatView.swift
//  Crypto
//
//  Created by Imran on 6/4/22.
//

import SwiftUI

struct HomeStatView: View {
  
    @EnvironmentObject private var vm: HomeVieModel
    @Binding var showProtfolio: Bool
    
    var body: some View {
        HStack{
            ForEach(vm.statistic){ stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showProtfolio ? .trailing : .leading)
    }
}

struct HomeStatView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatView(showProtfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
