//
//  NewMessageView.swift
//  ChatApp
//
//  Created by Imran Mia on 4/1/22.
//

import SwiftUI

struct NewMessageView: View {
    
     @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<20) { item in
                    Text("sdf")
                }
            }.navigationTitle("New Message")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                          Text("Cancel")
                        }
                    }
                }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
