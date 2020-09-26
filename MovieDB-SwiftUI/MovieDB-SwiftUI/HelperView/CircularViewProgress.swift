//
//  CircularViewProgress.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct CircularViewProgress: View {
    @State var circleProgress:CGFloat = 0.2
    var body : some View{
        ZStack{
            Circle()
                .stroke(Color.gray, lineWidth: 10)
                .frame(width: 50, height: 50)
            
            Circle()
                .trim(from: 0.0, to: circleProgress)
                .stroke(Color.blue, lineWidth: 10)
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: -90))
            Text("\(((self.circleProgress*100).fractionDigitsRounded(to: 1)))")
        }
        
    }
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                self.circleProgress += 0.01
                if self.circleProgress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct CircularViewProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircularViewProgress()
    }
}
