//
//  chapter4 + Filtering operator .swift
//  CombieSwiftUI
//
//  Created by Imran on 23/5/22.
//

import Foundation
import Combine

extension ContentView{
        
    func filterBasic(){
        SupportCode.example(of: "Filter Basic") {
            var subscriptions = Set<AnyCancellable>()

            let numbers = (1...100).publisher
            numbers
                .filter { $0.isMultiple(of: 3)}
                .sink { item in
                    print(item)
                }
                .store(in: &subscriptions)
        }
    }
    
    func removeDuplicates(){
        SupportCode.example(of: "Remove Duplicates") {
            var subscriptions = Set<AnyCancellable>()

            let words = "hey hey there! want to listen to mister mister ha ha ha ha ?".components(separatedBy: " ").publisher
            
            words
                .removeDuplicates()
//                .map{ $0 }
                .sink { item in
                    print(item )
                }.store(in: &subscriptions)
        }
    }
    
    func conpactMapValues(){
        SupportCode.example(of: "Compact Map") {
            var subscriptios = Set<AnyCancellable>()
            
            let stringValues = [" ", "", "", "", "", "i"].publisher
            
            stringValues
                .compactMap{  ($0) }
                .sink { item in
                    print(item)
                }
                .store(in: &subscriptios)
        }
    }
    
    func ignoreOutpuValues(){
        SupportCode.example(of: "IgnoreOutput") {
            var subscribes = Set<AnyCancellable>()
            let numbersValues = (1...10_000).publisher
            
            numbersValues
                .ignoreOutput()
                .sink { errors in
                    print("Compled with: \(errors)")
                } receiveValue: { item in
                 print(item)
                }
                .store(in: &subscribes)
        }
    }
}
