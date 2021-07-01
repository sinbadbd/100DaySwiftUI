//
//      TestView.swift
//      MasterySwiftUI
//
//      Created by Imran on 22  5  21.

struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}


import SwiftUI

struct TestView: View {
    @State private var showActionSheet = false
    var body: some View {
        Button("Tap to show action sheet") {
            showActionSheet = true
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Resume Workout Recording"),
                        message: Text("Choose a destination for workout data"),
                        buttons: [
                            .cancel(),
                            .destructive(
                                Text("Overwrite Current Workout")
                                //                                action: overwriteWorkout
                            ),
                            .default(
                                Text("Append to Current Workout")
                                //                                action: appendWorkout
                            )
                        ]
            )
        }
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
