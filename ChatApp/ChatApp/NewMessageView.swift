//
//  NewMessageView.swift
//  ChatApp
//
//  Created by Imran Mia on 4/1/22.
//

import SwiftUI

struct NewMessageView: View {
    
    
    
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
