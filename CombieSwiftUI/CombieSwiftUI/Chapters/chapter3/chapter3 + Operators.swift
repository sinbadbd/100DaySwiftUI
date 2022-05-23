//
//  chapter3 + Operators.swift
//  CombieSwiftUI
//
//  Created by Imran on 23/5/22.
//

import Foundation
import Combine

extension ContentView{
 
    func collectingValues(){
        
        var subscriptions = Set<AnyCancellable>()
        
        SupportCode.example(of: "Collect") {
            ["A", "B", "C", "D", "E"].publisher
                .collect(2)
                .sink(
                    receiveCompletion: {
                        print($0)
                    },
                    receiveValue:{
                        print($0)
                    }
                )
                .store(in: &subscriptions)
        }
    }
    
    func mappingValue(){
        print("\n---------> Map <---------")
        var subscriptions = Set<AnyCancellable>()
        
        SupportCode.example(of: "Map") {
            let formatter = NumberFormatter()
            formatter.numberStyle = .spellOut
            
            [123, 4, 56].publisher
                .map { item in
                    formatter.string(for: NSNumber(integerLiteral: item) )
                }
                .sink { data in
                    print(data as Any)
                }.store(in: &subscriptions)
        }
    }
    
    func tryMapValue(){
        print("\n---------> tryMap <---------")
        var subscriptions = Set<AnyCancellable>()
        
         Just("Directory name that does not exist")
        
            .tryMap { values in
                try FileManager.default.contentsOfDirectory(atPath: values)
            }
            .sink { errors in
                print(errors)
            } receiveValue: { item in
                print(item)
            }.store(in: &subscriptions)
    }
    
    func flatMapValues(){
        print("\n---------> flatMap <---------")
        var subscriptions = Set<AnyCancellable>()
        
        let chat_one = Chatter(name: "sinbad", message: "hii")
        let chat_two = Chatter(name: "imran", message: "Hello")
        
        let chat = CurrentValueSubject<Chatter, Never>(chat_one)
        
        chat_one.message.value = "How's it going?"
        
        chat.value = chat_two
            
        chat
            .flatMap{ $0.message }
            .sink { chats in
                print(chats)// print(chats.message.value)
            }
            .store(in: &subscriptions)
        
    }
}
