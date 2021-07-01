//    
//      TransactionExample.swift
//      MasterySwiftUI
//    
//      Created by Imran on 22  5  21.
    

import SwiftUI

       struct TransactionExample: View {
           @State var flag = false
  
           var body: some View {
               VStack(spacing: 50) {
                   HStack(spacing: 30) {
                       Text("Rotation")
                           .rotationEffect(Angle(degrees:
                                                   self.flag ? 360 : 0))
  
                       Text("Rotation\nModified")
                           .rotationEffect(Angle(degrees:
                                                   self.flag ? 360 : 0))
                           .transaction { view in
                               view.animation =
                                   view.animation?.delay(2.0).speed(2)
                           }
  
                       Text("Animation\nReplaced")
                           .rotationEffect(Angle(degrees:
                                                   self.flag ? 360 : 0))
                           .transaction { view in
                               view.animation = .interactiveSpring(
                                   response: 0.60,
                                   dampingFraction: 0.20,
                                   blendDuration: 0.25)
                           }
                   }
  
                   Button("Animate") {
                       withAnimation(.easeIn(duration: 2.0)) {
                           self.flag.toggle()
                       }
                   }
               }
           }
       }

struct TransactionExample_Previews: PreviewProvider {
    static var previews: some View {
        TransactionExample()
    }
}
