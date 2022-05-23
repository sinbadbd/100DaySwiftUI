//
//  TaskBootCamp.swift
//  SwiftConcurencyBootcamp
//
//  Created by Imran on 16/5/22.
//

import SwiftUI

class TaskBootcaomViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
//    let url = URL(string: "https://picsum.photos/200")
    
    func fetchImage() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            self.image = UIImage(data: data)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            self.image2 = UIImage(data: data)
        }catch {
            print(error.localizedDescription)
        }
    }
}


struct TaskBootCamp: View {
    
    @StateObject private var viewModel = TaskBootcaomViewModel()
    @State private var isBig: Bool = false
    
    var body: some View {
        VStack{
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(width: isBig == true ? 300: 200, height: isBig == true ? 300: 200, alignment: .center)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.5)) {
                            self.isBig.toggle()
                        }
                    }
            }
            
                if let image = viewModel.image2 {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(width: isBig == true ? 300: 200, height: isBig == true ? 300: 200, alignment: .center)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.5)) {
                                self.isBig.toggle()
                            }
                        }
                }
        }.onAppear {
            
            Task(priority: .low) {
                print("Low: \(Thread.current) : \(Task.currentPriority)")
            }
            Task(priority: .medium) {
                print("medium: \(Thread.current) : \(Task.currentPriority)")
            }
            Task(priority: .high) {
                print("high: \(Thread.current) : \(Task.currentPriority)")
            }
            Task(priority: .background) {
                print("background: \(Thread.current) : \(Task.currentPriority)")
            }
            Task(priority: .utility) {
                print("utility: \(Thread.current) : \(Task.currentPriority)")
            }
            Task(priority: .userInitiated) {
                print("userInitiated: \(Thread.current) : \(Task.currentPriority)")
            }
            
//            Task{
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage()
//            }
//
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage2()
//            }
        }
    }
}

struct TaskBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootCamp()
    }
}
