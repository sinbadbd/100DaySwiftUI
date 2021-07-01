//
//  MovieArtistProfile.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct MovieArtistProfile: View {
     var cast : Cast?
//    var persionRes : MoviePersonResponse
    
//    @ObservedObject private var persion = PersonManager(movie: persionRes)
    
//    var movie: Movie
    var person: MoviePersonResponse
    @ObservedObject var persionManager : PersonManager
    
    init(cast: Cast) {
        self.init(cast: cast)
//        self.cast = cast
//        self.persionManager = PersonManager(cast: cast, personRes: person)
        //
    }
    
    var body: some View {
        VStack{
            ScrollView( showsIndicators: false){
                VStack{
                    Text("\(person.name ?? "")")
                        .font(.title)
//                    Text("\(person.)")
                }
            }
            
            /*
            AsyncImage(url: URL(string: cast?.profilePhoto ?? "" )!) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.5))
                
            } image: { (img) -> Image in
                Image(uiImage: img)
                    .resizable()
            }
             .frame(height:300)
            .animation(.easeOut(duration: 0.5))
            .transition(.opacity)
            .scaledToFit()
            .cornerRadius(15)
            .shadow(radius: 15)
            */
           
//            Text("\(cast?.character ?? "")")
//            Text("\(cast?.profilePhoto ?? "")")
//            Text("\(cast?.profile_path ?? "")")
            
//            Spacer()
        }
        .onAppear{
            persionManager.getPersonData(id: 2131)
        }
//        .frame(maxHeight:.infinity)
//        .foregroundColor(Color./green)
//        .background(Color.red)
       
    }
}
//
//struct MovieArtistProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieArtistProfile(name: "")
//    }
//}
