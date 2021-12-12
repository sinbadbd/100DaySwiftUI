//
//  MyDayView.swift
//  InstagramClone
//
//  Created by Imran Mia on 4/12/21.
//

import SwiftUI

struct MyDayView: View {
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach (0..<10) { pic in
                        if pic == 0 {
                            ProfileUploadView()
                        }else {
                            MyDayCell()
                        } 
                    }
                }
            }
        }
    }
}

struct MyDayView_Previews: PreviewProvider {
    static var previews: some View {
        MyDayView()
    }
}
