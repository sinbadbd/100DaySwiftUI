//
//  ContentView.swift
//  WhatsNewSwiftUI
//
//  Created by Imran Mia on 23/10/21.
//

import SwiftUI

struct Images: Identifiable {
    var id: ObjectIdentifier?
    let image: String?
    
//    init(id:ObjectIdentifier?,image:String?){
//        self.id = id
//        self.image = image
//    }
}

struct Photo: Decodable {
    let id: Int
    let title: String
    let thumbnailUrl: String
}

private func loadPhotos() async throws -> [Photo] {
        
        // I am forced unwrapping but you should make sure to unwrap is safely
        let photosURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let (data, _) = try await URLSession.shared.data(from: photosURL)
        
        let photos = try? JSONDecoder().decode([Photo].self, from: data)
        return photos ?? []
    }

struct ImagesVM {
    
    var imageArr = [
        Images(image: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
        Images(image: "https://cdn.pixabay.com/photo/2013/10/02/23/03/mountains-190055_1280.jpg"),
        Images(image: "https://cdn.pixabay.com/photo/2015/06/19/20/13/sunset-815270_1280.jpg"),
        Images(image: "https://cdn.pixabay.com/photo/2015/12/01/20/28/forest-1072828_1280.jpg")
    ]
    
}


struct ContentView: View {
    
    var list: ImagesVM?
   
    var body: some View {
        VStack{
           Text("image")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
