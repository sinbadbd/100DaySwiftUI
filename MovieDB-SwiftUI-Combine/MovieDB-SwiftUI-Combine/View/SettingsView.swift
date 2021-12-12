//
//  SettingsView.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented : Bool
    @State private var selection = 1
    @State private var email = ""
    //    @State private var submit = false
    
    var body: some View {
        NavigationView{
            Form {
                Picker(selection: $selection, label: Text("Favorite Gener")) {
                    Text("Action").tag(1)
                    Text("Comedy").tag(2)
                    Text("Horror").tag(3)
                    Text("Scify").tag(4)
                }
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Save")
                })
            }.navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: Binding<Bool>.constant(false))
    }
}
