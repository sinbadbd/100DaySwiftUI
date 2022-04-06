//
//  StatisticView.swift
//  Crypto
//
//  Created by Imran on 6/4/22.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {

        VStack(alignment: .leading, spacing: 4){
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack{
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChage ?? 0) >= 0 ? 0: 180)
                    )
                
                Text( stat.percentageChage?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChage ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChage == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.stat1)
            .previewLayout(.sizeThatFits)
        StatisticView(stat: dev.stat2)
            .previewLayout(.sizeThatFits)
        StatisticView(stat: dev.stat3)
            .previewLayout(.sizeThatFits)

    }
}
