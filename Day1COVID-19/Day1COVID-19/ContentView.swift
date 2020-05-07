//
//  ContentView.swift
//  Day1COVID-19
//
//  Created by Imran on 7/5/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home:View {
    
    @State var index = 0
    @State var main : MainData!
    
    var body: some View {
        
        VStack{
            if self.main != nil {
                VStack(spacing: 18){
                    VStack{
                        HStack{
                            Text("Statistics")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                
                            }){
                                Text("USA")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            
                        }
                        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                        .padding(.horizontal)
                        //
                        
                        HStack{
                            Button(action: {
                                self.index = 0
                                self.main = nil
                                self.getData()
                            }){
                                Text("My Country")
                                    .foregroundColor(self.index == 0 ? .black : .white)
                                    .padding(.vertical, 12)
                                    .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            }
                            .background(self.index == 0 ? Color.white : Color.clear)
                            .clipShape(Capsule())
                            
                            Button(action: {
                                self.index = 1
                                self.main = nil
                                self.getData()
                            }){
                                Text("USA")
                                    .foregroundColor(self.index == 1 ? .black : .white)
                                    .padding(.vertical, 12)
                                    .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            }
                            .background(self.index == 1 ? Color.white : Color.clear)
                            .clipShape(Capsule())
                        }
                        .background(Color.black.opacity(0.25))
                        .clipShape(Capsule())
                        .padding(.top, 20)
                        
                        
                        HStack(spacing: 15){
                            VStack(spacing: 12){
                                Text("Affected")
                                    .fontWeight(.bold)
                                Text("\(self.main.cases)")
                                    .fontWeight(.bold)
                                    .font(.title)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .background(Color("affected"))
                            .cornerRadius(12)
                            
                            
                            VStack(spacing: 12){
                                Text("Daed")
                                    .fontWeight(.bold)
                                Text("\(self.main.deaths)")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                            .background(Color("daed"))
                            .cornerRadius(12)
                        }.padding(.top, 20)
                            .foregroundColor(.white)
                        
                        
                        HStack(spacing: 15){
                            VStack(spacing: 12){
                                Text("Recover")
                                    .fontWeight(.bold)
                                Text("\(self.main.recovered)")
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .background(Color("Recover"))
                            .cornerRadius(12)
                            
                            
                            VStack(spacing: 12){
                                Text("Active")
                                    .fontWeight(.bold)
                                Text("\(self.main.active)")
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .background(Color("Active"))
                            .cornerRadius(12)
                            
                            
                            VStack(spacing: 12){
                                Text("Serious")
                                    .fontWeight(.bold)
                                Text("\(self.main.critical)")
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                            .background(Color("Serious"))
                            .cornerRadius(12)
                            
                            
                        }.padding(.top, 20)
                            .foregroundColor(.white)
                        
                        
                    }
                    .padding(.bottom, 30)
                    .background(Color("bg"))
                    
                    VStack(spacing: 15){
                        HStack {
                            Text("7 Days")
                                .font(.title)
                                .foregroundColor(.black)
                            Spacer()
                        }.padding(.top, 10)
                        HStack{
                            ForEach(0...6, id: \.self){_ in
                                VStack(spacing: 10){
                                    Text("300K")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    
                                    GeometryReader{g in
                                        VStack{
                                            Spacer(minLength: 0)
                                            Capsule()
                                                .foregroundColor(.red)
                                                //                                        .fill(Color("dead"))
                                                .frame(width:15)
                                        }
                                    }
                                    
                                    Text("4/4/2020")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.bottom, -30)
                    .offset(y: -30)
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            self.getData()
        }
    }
    
    func getData(){
        var url = ""
         
        
        if self.index == 0{
            url = "https://corona.lmao.ninja/v2/countries/usa?yesterday=false"
        }
        else{
            
           url = "https://corona.lmao.ninja/v2/all?today"
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSONDecoder().decode(MainData.self, from: data!)
            
            self.main = json
        }
        .resume()
        
    }
    
}

// Data Models For JSON Parsing....

struct Daily: Identifiable{
    
    var id : Int
    var day : String
    var cases : Int
}

struct MainData : Decodable{
    
    var deaths : Int
    var recovered : Int
    var active : Int
    var critical : Int
    var cases : Int
}

struct MyCountry : Decodable {
    
    var timeline : [String : [String : Int]]
}

struct Global : Decodable {
    
    var cases : [String : Int]
}


