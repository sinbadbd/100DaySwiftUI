//
//  AsyncAwaitBootcamp.swift
//  SwiftConcurencyBootcamp
//
//  Created by Imran on 15/5/22.
//

import SwiftUI
import Combine

class AsyncAwaitBootcampVewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func addTitle1(){
      
        self.dataArray.append("title 1: \(Thread.current)")
    }
    
    
    func addAuther1() async {
        let auther1 = "Auther-1: \(Thread.current)"
        self.dataArray.append(auther1)
        try? await Task.sleep(nanoseconds: 2_000_000_000)

        let auther2 = "Auther-2: \(Thread.current)"

        await MainActor.run(body: {
            self.dataArray.append(auther2)

            let auther3 = "Auther-3: \(Thread.current)"
            self.dataArray.append(auther3)
        })

    }
    
    func addSomething() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        let something1 = "something1: \(Thread.current)"

        self.dataArray.append(something1)

        let something2 = "something2: \(Thread.current)"
        self.dataArray.append(something2)
        
    }
}


struct AsyncAwaitBootcamp: View {
    
    @StateObject private var viewMode = AsyncAwaitBootcampVewModel()

    var body: some View {
        List{
            ForEach(viewMode.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            Task {
                await viewMode.addAuther1()
                await viewMode.addSomething()
                let finalText = "Final Text: \(Thread.current)"
                viewMode.dataArray.append(finalText)
            }
//            viewMode.addTitle1()
        }
    }
}

struct AsyncAwaitBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitBootcamp()
    }
}
