//
//  ShareCommentSheetView.swift
//  Instagram-SwiftUI
//
//  Created by Imran on 4/7/21.
//

import SwiftUI

struct ShareCommentSheetView: View {
    
    @Binding var presentedAsModal: Bool

        var body: some View {
            Button("Press to dismiss") {
                self.presentedAsModal = false
            }
            .font(.title)
            .padding()
            .background(Color.black)
        }
}

//struct ShareCommentSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShareCommentSheetView(presentedAsModal: false)
//    }
//}
