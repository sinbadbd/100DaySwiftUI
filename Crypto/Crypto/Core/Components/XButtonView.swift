//
//  XButtonView.swift
//  Crypto
//
//  Created by Imran on 10/4/22.
//

import SwiftUI

struct XButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack{
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.caption2)

            }
        }
    }
}

struct XButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XButtonView()
    }
}
