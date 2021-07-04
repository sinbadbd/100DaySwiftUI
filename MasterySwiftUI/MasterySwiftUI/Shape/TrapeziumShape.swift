//
//  TrapeziumShape.swift
//  MasterySwiftUI
//
//  Created by Imran on 3/7/21.
//

import SwiftUI

struct Trapezium : Shape {
    func path(in rect: CGRect) -> Path {
       var path = Path()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
       return path
    }
    
    
}

struct TrapeziumShape: View {
    var body: some View {
        VStack{
            Color.red
            Trapezium()
        }
    }
}

struct TrapeziumShape_Previews: PreviewProvider {
    static var previews: some View {
        TrapeziumShape()
    }
}
